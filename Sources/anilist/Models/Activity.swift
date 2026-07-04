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
    public let isLocked: Bool
    public let isSubscribed: Bool
    public let likeCount: Int
    public let isLiked: Bool
    public let isPinned: Bool
    public let createdAt: Int
    public let user: User?
    
    public enum CodingKeys: String, CodingKey {
        case id, userId, type, replyCount, text, siteUrl, isLocked, isSubscribed, likeCount, isLiked, isPinned, createdAt, user
    }
    
    public init(id: Int, userId: Int? = nil, type: ActivityType? = nil, replyCount: Int = 0, text: String? = nil, siteUrl: String? = nil, isLocked: Bool = false, isSubscribed: Bool = false, likeCount: Int = 0, isLiked: Bool = false, isPinned: Bool = false, createdAt: Int, user: User? = nil) {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId)
        self.type = try container.decodeIfPresent(ActivityType.self, forKey: .type)
        self.replyCount = try container.decode(Int.self, forKey: .replyCount)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.siteUrl = try container.decodeIfPresent(String.self, forKey: .siteUrl)
        self.isLocked = try container.decodeIfPresent(Bool.self, forKey: .isLocked) ?? false
        self.isSubscribed = try container.decodeIfPresent(Bool.self, forKey: .isSubscribed) ?? false
        self.likeCount = try container.decode(Int.self, forKey: .likeCount)
        self.isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
        self.isPinned = try container.decodeIfPresent(Bool.self, forKey: .isPinned) ?? false
        self.createdAt = try container.decode(Int.self, forKey: .createdAt)
        self.user = try container.decodeIfPresent(User.self, forKey: .user)
    }
}

public struct ListActivity: Codable, Equatable, Sendable {
    public let id: Int
    public let userId: Int?
    public let type: ActivityType?
    public let replyCount: Int
    public let status: String?
    public let progress: String?
    public let isLocked: Bool
    public let isSubscribed: Bool
    public let likeCount: Int
    public let isLiked: Bool
    public let isPinned: Bool
    public let siteUrl: String?
    public let createdAt: Int
    public let user: User?
    public let media: Media?
    
    public enum CodingKeys: String, CodingKey {
        case id, userId, type, replyCount, status, progress, isLocked, isSubscribed, likeCount, isLiked, isPinned, siteUrl, createdAt, user, media
    }
    
    public init(id: Int, userId: Int? = nil, type: ActivityType? = nil, replyCount: Int = 0, status: String? = nil, progress: String? = nil, isLocked: Bool = false, isSubscribed: Bool = false, likeCount: Int = 0, isLiked: Bool = false, isPinned: Bool = false, siteUrl: String? = nil, createdAt: Int, user: User? = nil, media: Media? = nil) {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId)
        self.type = try container.decodeIfPresent(ActivityType.self, forKey: .type)
        self.replyCount = try container.decode(Int.self, forKey: .replyCount)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.progress = try container.decodeIfPresent(String.self, forKey: .progress)
        self.isLocked = try container.decodeIfPresent(Bool.self, forKey: .isLocked) ?? false
        self.isSubscribed = try container.decodeIfPresent(Bool.self, forKey: .isSubscribed) ?? false
        self.likeCount = try container.decode(Int.self, forKey: .likeCount)
        self.isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
        self.isPinned = try container.decodeIfPresent(Bool.self, forKey: .isPinned) ?? false
        self.siteUrl = try container.decodeIfPresent(String.self, forKey: .siteUrl)
        self.createdAt = try container.decode(Int.self, forKey: .createdAt)
        self.user = try container.decodeIfPresent(User.self, forKey: .user)
        self.media = try container.decodeIfPresent(Media.self, forKey: .media)
    }
}

public struct MessageActivity: Codable, Equatable, Sendable {
    public let id: Int
    public let recipientId: Int?
    public let messengerId: Int?
    public let type: ActivityType?
    public let replyCount: Int
    public let message: String?
    public let isLocked: Bool
    public let isSubscribed: Bool
    public let likeCount: Int
    public let isLiked: Bool
    public let isPrivate: Bool
    public let siteUrl: String?
    public let createdAt: Int
    public let recipient: User?
    public let messenger: User?
    
    public enum CodingKeys: String, CodingKey {
        case id, recipientId, messengerId, type, replyCount, message, isLocked, isSubscribed, likeCount, isLiked, isPrivate, siteUrl, createdAt, recipient, messenger
    }
    
    public init(id: Int, recipientId: Int? = nil, messengerId: Int? = nil, type: ActivityType? = nil, replyCount: Int = 0, message: String? = nil, isLocked: Bool = false, isSubscribed: Bool = false, likeCount: Int = 0, isLiked: Bool = false, isPrivate: Bool = false, siteUrl: String? = nil, createdAt: Int, recipient: User? = nil, messenger: User? = nil) {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.recipientId = try container.decodeIfPresent(Int.self, forKey: .recipientId)
        self.messengerId = try container.decodeIfPresent(Int.self, forKey: .messengerId)
        self.type = try container.decodeIfPresent(ActivityType.self, forKey: .type)
        self.replyCount = try container.decode(Int.self, forKey: .replyCount)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.isLocked = try container.decodeIfPresent(Bool.self, forKey: .isLocked) ?? false
        self.isSubscribed = try container.decodeIfPresent(Bool.self, forKey: .isSubscribed) ?? false
        self.likeCount = try container.decode(Int.self, forKey: .likeCount)
        self.isLiked = try container.decodeIfPresent(Bool.self, forKey: .isLiked) ?? false
        self.isPrivate = try container.decodeIfPresent(Bool.self, forKey: .isPrivate) ?? false
        self.siteUrl = try container.decodeIfPresent(String.self, forKey: .siteUrl)
        self.createdAt = try container.decode(Int.self, forKey: .createdAt)
        self.recipient = try container.decodeIfPresent(User.self, forKey: .recipient)
        self.messenger = try container.decodeIfPresent(User.self, forKey: .messenger)
    }
}

public enum Activity: Codable, Equatable, Sendable {
    case text(TextActivity)
    case list(ListActivity)
    case message(MessageActivity)
    
    public enum CodingKeys: String, CodingKey {
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
