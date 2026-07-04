import Foundation

public extension AniListQueries {
    /// A query to search for Media with pagination and filters.
    struct SearchQuery: GraphQLRequest {
        public struct Response: Decodable, Equatable, Sendable {
            public let page: PageData?
            
            enum CodingKeys: String, CodingKey {
                case page = "Page"
            }
            
            public struct PageData: Decodable, Equatable, Sendable {
                public let pageInfo: PageInfo?
                public let media: [Media]?
            }
        }
        
        public struct Variables: Encodable, Equatable, Sendable {
            public let page: Int?
            public let perPage: Int?
            public let search: String?
            public let type: MediaType?
            public let sort: [MediaSort]?
            public let isAdult: Bool?
            
            enum CodingKeys: String, CodingKey {
                case page
                case perPage
                case search
                case type
                case sort
                case isAdult
            }
            
            public init(page: Int? = 1, perPage: Int? = 20, search: String? = nil, type: MediaType? = nil, sort: [MediaSort]? = nil, isAdult: Bool? = false) {
                self.page = page
                self.perPage = perPage
                self.search = search
                self.type = type
                self.sort = sort
                self.isAdult = isAdult
            }
        }
        
        public var query: String {
            """
            query (
              $page: Int,
              $perPage: Int,
              $search: String,
              $type: MediaType,
              $sort: [MediaSort],
              $isAdult: Boolean
            ) {
              Page(page: $page, perPage: $perPage) {
                pageInfo {
                  total
                  perPage
                  currentPage
                  lastPage
                  hasNextPage
                }
                media(search: $search, type: $type, sort: $sort, isAdult: $isAdult) {
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
                  coverImage {
                    extraLarge
                    large
                    medium
                    color
                  }
                  averageScore
                  popularity
                }
              }
            }
            """
        }
        
        public let variables: Variables?
        
        public init(page: Int? = 1, perPage: Int? = 20, search: String? = nil, type: MediaType? = nil, sort: [MediaSort]? = nil, isAdult: Bool? = false) {
            self.variables = Variables(page: page, perPage: perPage, search: search, type: type, sort: sort, isAdult: isAdult)
        }
    }
}
