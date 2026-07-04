import Foundation

public struct User: Codable, Equatable, Sendable {
    public let id: Int
    public let name: String
    public let avatar: UserAvatar?
    public let statistics: UserStatisticTypes?
    
    public init(id: Int, name: String, avatar: UserAvatar? = nil, statistics: UserStatisticTypes? = nil) {
        self.id = id
        self.name = name
        self.avatar = avatar
        self.statistics = statistics
    }
}

public struct UserAvatar: Codable, Equatable, Sendable {
    public let large: String?
    public let medium: String?
    
    public init(large: String? = nil, medium: String? = nil) {
        self.large = large
        self.medium = medium
    }
}

public struct UserStatisticTypes: Codable, Equatable, Sendable {
    public let anime: UserStatistics?
    public let manga: UserStatistics?
    
    public init(anime: UserStatistics? = nil, manga: UserStatistics? = nil) {
        self.anime = anime
        self.manga = manga
    }
}

public struct UserStatistics: Codable, Equatable, Sendable {
    public let count: Int?
    public let episodesWatched: Int?
    public let chaptersRead: Int?
    
    public init(count: Int? = nil, episodesWatched: Int? = nil, chaptersRead: Int? = nil) {
        self.count = count
        self.episodesWatched = episodesWatched
        self.chaptersRead = chaptersRead
    }
}
