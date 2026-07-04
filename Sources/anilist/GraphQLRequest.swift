import Foundation

/// A protocol representing a single GraphQL request (query or mutation).
public protocol GraphQLRequest {
    /// The expected decodable response type.
    associatedtype Response: Decodable
    
    /// The type of the variables. Use `String` or a custom struct.
    associatedtype Variables: Encodable 
    
    /// The raw GraphQL query string.
    var query: String { get }
    
    /// The variables for the query.
    var variables: Variables? { get }
}

/// A default extension to provide nil variables for requests that don't need them.
public extension GraphQLRequest {
    var variables: String? { return nil }
}
