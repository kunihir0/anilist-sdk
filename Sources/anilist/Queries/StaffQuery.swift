import Foundation

public extension AniListQueries {
    /// A query to fetch detailed information for a single Staff member by its ID.
    struct StaffQuery: GraphQLRequest {
        public struct Response: Decodable, Equatable, Sendable {
            public let staff: Staff?
            
            enum CodingKeys: String, CodingKey {
                case staff = "Staff"
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
              Staff (id: $id) {
                id
                name {
                  first
                  middle
                  last
                  full
                  native
                  userPreferred
                  alternative
                }
                languageV2
                image {
                  large
                  medium
                }
                description
                primaryOccupations
                gender
                dateOfBirth {
                  year
                  month
                  day
                }
                dateOfDeath {
                  year
                  month
                  day
                }
                age
                yearsActive
                homeTown
                bloodType
                isFavourite
                isFavouriteBlocked
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
