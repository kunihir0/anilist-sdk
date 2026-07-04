import Foundation

public extension AniListQueries {
    /// A query to fetch detailed information for a single Activity by its ID.
    struct ActivityQuery: GraphQLRequest {
        public struct Response: Decodable, Equatable, Sendable {
            public let activity: Activity?
            
            enum CodingKeys: String, CodingKey {
                case activity = "Activity"
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
              Activity (id: $id) {
                __typename
                ... on TextActivity {
                  id
                  userId
                  type
                  replyCount
                  text
                  siteUrl
                  isLocked
                  isSubscribed
                  likeCount
                  isLiked
                  isPinned
                  createdAt
                  user {
                    id
                    name
                    avatar {
                      large
                      medium
                    }
                  }
                }
                ... on ListActivity {
                  id
                  userId
                  type
                  replyCount
                  status
                  progress
                  isLocked
                  isSubscribed
                  likeCount
                  isLiked
                  isPinned
                  siteUrl
                  createdAt
                  user {
                    id
                    name
                    avatar {
                      large
                      medium
                    }
                  }
                  media {
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
                ... on MessageActivity {
                  id
                  recipientId
                  messengerId
                  type
                  replyCount
                  message
                  isLocked
                  isSubscribed
                  likeCount
                  isLiked
                  isPrivate
                  siteUrl
                  createdAt
                  recipient {
                    id
                    name
                    avatar {
                      large
                      medium
                    }
                  }
                  messenger {
                    id
                    name
                    avatar {
                      large
                      medium
                    }
                  }
                }
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
