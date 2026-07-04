import Foundation

public extension AniListQueries {
    /// A query to fetch detailed information for a single Character by its ID.
    struct CharacterQuery: GraphQLRequest {
        public struct Response: Decodable, Equatable, Sendable {
            public let character: Character?
            
            enum CodingKeys: String, CodingKey {
                case character = "Character"
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
              Character (id: $id) {
                id
                name {
                  first
                  middle
                  last
                  full
                  native
                  userPreferred
                  alternative
                  alternativeSpoiler
                }
                image {
                  large
                  medium
                }
                description
                gender
                dateOfBirth {
                  year
                  month
                  day
                }
                age
                bloodType
                isFavourite
                siteUrl
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
