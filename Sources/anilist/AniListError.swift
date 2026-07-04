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
        case let (.networkError(lhsValue), .networkError(rhsValue)):
            return lhsValue.code == rhsValue.code
            
        case let (.httpError(lhsValue), .httpError(rhsValue)):
            return lhsValue == rhsValue
            
        case let (.rateLimitExceeded(lhsValue), .rateLimitExceeded(rhsValue)):
            return lhsValue == rhsValue
            
        case let (.graphqlErrors(lhsValue), .graphqlErrors(rhsValue)):
            return lhsValue == rhsValue
            
        case let (.decodingError(lhsValue), .decodingError(rhsValue)):
            return lhsValue == rhsValue
            
        default:
            return false
        }
    }
}
