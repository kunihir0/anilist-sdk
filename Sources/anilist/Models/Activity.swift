import Foundation

public enum ActivityType: String, Codable, Equatable, Sendable {
    case text = "TEXT"
    case animeList = "ANIME_LIST"
    case mangaList = "MANGA_LIST"
    case message = "MESSAGE"
    case mediaList = "MEDIA_LIST"
}

public struct TextActivity: Codable, Equatable, Sendable {
    public let id: Int
    public let userId: Int?
    public let type: ActivityType?
    public let replyCount: Int
    public let text: String?
    public let siteUrl: String?
    public let isLocked: Bool?
    public let isSubscribed: Bool?
    public let likeCount: Int
    public let isLiked: Bool?
    public let isPinned: Bool?
    public let createdAt: Int
    public let user: User?
    
    public init(id: Int, userId: Int? = nil, type: ActivityType? = nil, replyCount: Int = 0, text: String? = nil, siteUrl: String? = nil, isLocked: Bool? = nil, isSubscribed: Bool? = nil, likeCount: Int = 0, isLiked: Bool? = nil, isPinned: Bool? = nil, createdAt: Int, user: User? = nil) {
        self.id = id
        self.userId = userId
        self.type = type
        self.replyCount = replyCount
        self.text = text
        self.siteUrl = siteUrl
        self.isLocked = isLocked
        self.isSubscribed = isSubscribed
        self.likeCount = likeCount
        self.isLiked = isLiked
        self.isPinned = isPinned
        self.createdAt = createdAt
        self.user = user
    }
}

public struct ListActivity: Codable, Equatable, Sendable {
    public let id: Int
    public let userId: Int?
    public let type: ActivityType?
    public let replyCount: Int
    public let status: String?
    public let progress: String?
    public let isLocked: Bool?
    public let isSubscribed: Bool?
    public let likeCount: Int
    public let isLiked: Bool?
    public let isPinned: Bool?
    public let siteUrl: String?
    public let createdAt: Int
    public let user: User?
    public let media: Media?
    
    public init(id: Int, userId: Int? = nil, type: ActivityType? = nil, replyCount: Int = 0, status: String? = nil, progress: String? = nil, isLocked: Bool? = nil, isSubscribed: Bool? = nil, likeCount: Int = 0, isLiked: Bool? = nil, isPinned: Bool? = nil, siteUrl: String? = nil, createdAt: Int, user: User? = nil, media: Media? = nil) {
        self.id = id
        self.userId = userId
        self.type = type
        self.replyCount = replyCount
        self.status = status
        self.progress = progress
        self.isLocked = isLocked
        self.isSubscribed = isSubscribed
        self.likeCount = likeCount
        self.isLiked = isLiked
        self.isPinned = isPinned
        self.siteUrl = siteUrl
        self.createdAt = createdAt
        self.user = user
        self.media = media
    }
}

public struct MessageActivity: Codable, Equatable, Sendable {
    public let id: Int
    public let recipientId: Int?
    public let messengerId: Int?
    public let type: ActivityType?
    public let replyCount: Int
    public let message: String?
    public let isLocked: Bool?
    public let isSubscribed: Bool?
    public let likeCount: Int
    public let isLiked: Bool?
    public let isPrivate: Bool?
    public let siteUrl: String?
    public let createdAt: Int
    public let recipient: User?
    public let messenger: User?
    
    public init(id: Int, recipientId: Int? = nil, messengerId: Int? = nil, type: ActivityType? = nil, replyCount: Int = 0, message: String? = nil, isLocked: Bool? = nil, isSubscribed: Bool? = nil, likeCount: Int = 0, isLiked: Bool? = nil, isPrivate: Bool? = nil, siteUrl: String? = nil, createdAt: Int, recipient: User? = nil, messenger: User? = nil) {
        self.id = id
        self.recipientId = recipientId
        self.messengerId = messengerId
        self.type = type
        self.replyCount = replyCount
        self.message = message
        self.isLocked = isLocked
        self.isSubscribed = isSubscribed
        self.likeCount = likeCount
        self.isLiked = isLiked
        self.isPrivate = isPrivate
        self.siteUrl = siteUrl
        self.createdAt = createdAt
        self.recipient = recipient
        self.messenger = messenger
    }
}

public enum Activity: Codable, Equatable, Sendable {
    case text(TextActivity)
    case list(ListActivity)
    case message(MessageActivity)
    
    enum CodingKeys: String, CodingKey {
        case type = "__typename"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "TextActivity":
            let activity = try TextActivity(from: decoder)
            self = .text(activity)
        case "ListActivity":
            let activity = try ListActivity(from: decoder)
            self = .list(activity)
        case "MessageActivity":
            let activity = try MessageActivity(from: decoder)
            self = .message(activity)
        default:
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "Unknown activity type: \(type)"
            )
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .text(let activity):
            try container.encode("TextActivity", forKey: .type)
            try activity.encode(to: encoder)
        case .list(let activity):
            try container.encode("ListActivity", forKey: .type)
            try activity.encode(to: encoder)
        case .message(let activity):
            try container.encode("MessageActivity", forKey: .type)
            try activity.encode(to: encoder)
        }
    }
}
