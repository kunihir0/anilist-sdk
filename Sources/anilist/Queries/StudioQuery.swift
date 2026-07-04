import Foundation

public extension AniListQueries {
    /// A query to fetch detailed information for a single Studio by its ID.
    struct StudioQuery: GraphQLRequest {
        public struct Response: Decodable, Equatable, Sendable {
            public let studio: Studio?
            
            public enum CodingKeys: String, CodingKey {
                case studio = "Studio"
            }
        }
        
        public struct Variables: Encodable, Equatable, Sendable {
            public let id: Int
            
            public init(id: Int) {
                self.id = id
            }
        }
        
        public var query: String {
            """
            query ($id: Int) {
              Studio (id: $id) {
                id
                name
                isAnimationStudio
                siteUrl
                isFavourite
                favourites
              }
            }
            """
        }
        
        public let variables: Variables?
        
        public init(id: Int) {
            self.variables = Variables(id: id)
        }
    }
}
