import Foundation

public struct MediaListCollection: Decodable, Equatable, Sendable {
    public let lists: [MediaListGroup]?
    public let user: User?
    public let hasNextChunk: Bool
    
    public enum CodingKeys: String, CodingKey {
        case lists, user, hasNextChunk
    }
    
    public init(
        lists: [MediaListGroup]? = nil,
        user: User? = nil,
        hasNextChunk: Bool = false
    ) {
        self.lists = lists
        self.user = user
        self.hasNextChunk = hasNextChunk
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lists = try container.decodeIfPresent([MediaListGroup].self, forKey: .lists)
        self.user = try container.decodeIfPresent(User.self, forKey: .user)
        self.hasNextChunk = try container.decodeIfPresent(Bool.self, forKey: .hasNextChunk) ?? false
    }
}
