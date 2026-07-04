import Foundation

/// Namespace for AniList GraphQL queries.
public enum AniListQueries {}

public extension AniListQueries {
    /// A query to fetch the currently authenticated user.
    struct ViewerQuery: GraphQLRequest {
        public struct Response: Decodable, Equatable, Sendable {
            public let viewer: User?
            
            public enum CodingKeys: String, CodingKey {
                case viewer = "Viewer"
            }
        }
        
        public var query: String {
            """
            query {
              Viewer {
                id
                name
                avatar {
                  large
                  medium
                }
              }
            }
            """
        }
        
        public init() {}
    }
}
