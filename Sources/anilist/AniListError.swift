import Foundation

/// Errors that can occur when interacting with the AniList API.
public enum AniListError: Error, Equatable {
    /// A generic network error occurred (e.g., no internet connection).
    case networkError(URLError)
    
    /// The server returned an HTTP error code (e.g., 500 Internal Server Error).
    case httpError(statusCode: Int)
    
    /// The rate limit was exceeded. The `retryAfter` value contains the number of seconds to wait, if provided.
    case rateLimitExceeded(retryAfter: Int?)
    
    /// The server returned specific GraphQL errors.
    case graphqlErrors([GraphQLError])
    
    /// The response could not be decoded.
    case decodingError(String)
    
    public static func == (lhs: AniListError, rhs: AniListError) -> Bool {
        switch (lhs, rhs) {
        case (.networkError(let lhsValue), .networkError(let rhsValue)):
            return lhsValue.code == rhsValue.code
            
        case (.httpError(let lhsValue), .httpError(let rhsValue)):
            return lhsValue == rhsValue
            
        case (.rateLimitExceeded(let lhsValue), .rateLimitExceeded(let rhsValue)):
            return lhsValue == rhsValue
            
        case (.graphqlErrors(let lhsValue), .graphqlErrors(let rhsValue)):
            return lhsValue == rhsValue
            
        case (.decodingError(let lhsValue), .decodingError(let rhsValue)):
            return lhsValue == rhsValue
            
        default:
            return false
        }
    }
}
