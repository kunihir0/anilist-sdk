import Foundation

/// Represents a single GraphQL error returned by the server.
public struct GraphQLError: Decodable, Equatable, Sendable {
    public let message: String
    public let status: Int?
    
    public init(message: String, status: Int? = nil) {
        self.message = message
        self.status = status
    }
}

/// Internal wrapper for decoding the standard GraphQL JSON payload.
internal struct GraphQLResponse<T: Decodable>: Decodable {
    internal let data: T?
    internal let errors: [GraphQLError]?
}
