import Foundation

/// The main client for interacting with the AniList GraphQL API.
public struct AniListClient {
    private let session: URLSession
    private let tokenProvider: (() async throws -> String?)?
    private let endpoint = URL(string: "https://graphql.anilist.co")!

    /// Initializes a new AniList API client.
    /// - Parameters:
    ///   - session: The `URLSession` to use for network requests. Defaults to `.shared`.
    ///   - tokenProvider: An optional async closure that provides a valid OAuth2 Bearer token.
    public init(session: URLSession = .shared, tokenProvider: (() async throws -> String?)? = nil) {
        self.session = session
        self.tokenProvider = tokenProvider
    }
    
    /// Executes a GraphQL request against the AniList API.
    /// - Parameter request: The request conforming to `GraphQLRequest`.
    /// - Returns: The expected decoded response type.
    /// - Throws: `AniListError` if the request fails, hits rate limits, or returns GraphQL errors.
    public func execute<R: GraphQLRequest>(_ request: R) async throws -> R.Response {
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = try await tokenProvider?() {
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let payload = RequestPayload(query: request.query, variables: request.variables)
        do {
            urlRequest.httpBody = try JSONEncoder().encode(payload)
        } catch {
            throw AniListError.decodingError("Failed to encode request payload: \(error.localizedDescription)")
        }
        
        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await session.data(for: urlRequest)
        } catch let error as URLError {
            throw AniListError.networkError(error)
        } catch {
            throw AniListError.networkError(URLError(.unknown))
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AniListError.httpError(statusCode: 0)
        }
        
        if httpResponse.statusCode == 429 {
            var retryAfter: Int?
            if let retryStr = httpResponse.value(forHTTPHeaderField: "Retry-After") {
                retryAfter = Int(retryStr)
            }
            throw AniListError.rateLimitExceeded(retryAfter: retryAfter)
        }
        
        let graphQLResponse: GraphQLResponse<R.Response>
        do {
            graphQLResponse = try JSONDecoder().decode(GraphQLResponse<R.Response>.self, from: data)
        } catch {
            throw AniListError.decodingError("Failed to decode response: \(error.localizedDescription)")
        }
        
        if let errors = graphQLResponse.errors, !errors.isEmpty {
            if graphQLResponse.data == nil {
                throw AniListError.graphqlErrors(errors)
            }
            // If data is present but errors exist, we return the data (ignoring partial errors)
        }
        
        guard let responseData = graphQLResponse.data else {
            // This happens if both data and errors are nil, or if decoding succeeded but data is null
            throw AniListError.decodingError("Response contained neither data nor errors.")
        }
        
        return responseData
    }
}

// Internal wrapper for encoding the payload
private struct RequestPayload<V: Encodable>: Encodable {
    let query: String
    let variables: V?
}
