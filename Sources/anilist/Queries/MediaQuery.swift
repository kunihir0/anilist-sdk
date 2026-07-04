import Foundation

public extension AniListQueries {
    /// A query to fetch detailed information for a single Media (Anime or Manga) by its ID.
    struct MediaQuery: GraphQLRequest {
        public struct Response: Decodable, Equatable, Sendable {
            public let media: Media?
            
            enum CodingKeys: String, CodingKey {
                case media = "Media"
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
              Media (id: $id) {
                id
                title {
                  romaji
                  english
                  native
                  userPreferred
                }
                type
                format
                status
                description
                startDate {
                  year
                  month
                  day
                }
                endDate {
                  year
                  month
                  day
                }
                season
                seasonYear
                episodes
                duration
                chapters
                volumes
                coverImage {
                  extraLarge
                  large
                  medium
                  color
                }
                bannerImage
                genres
                averageScore
                popularity
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
