import Foundation

public struct Media: Codable, Equatable, Sendable {
    public let id: Int
    public let title: MediaTitle?
    public let type: MediaType?
    public let format: MediaFormat?
    public let status: MediaStatus?
    public let description: String?
    public let startDate: FuzzyDate?
    public let endDate: FuzzyDate?
    public let season: MediaSeason?
    public let seasonYear: Int?
    public let episodes: Int?
    public let duration: Int?
    public let chapters: Int?
    public let volumes: Int?
    public let coverImage: MediaCoverImage?
    public let bannerImage: String?
    public let genres: [String]?
    public let averageScore: Int?
    public let popularity: Int?
    
    public init(id: Int, title: MediaTitle? = nil, type: MediaType? = nil, format: MediaFormat? = nil, status: MediaStatus? = nil, description: String? = nil, startDate: FuzzyDate? = nil, endDate: FuzzyDate? = nil, season: MediaSeason? = nil, seasonYear: Int? = nil, episodes: Int? = nil, duration: Int? = nil, chapters: Int? = nil, volumes: Int? = nil, coverImage: MediaCoverImage? = nil, bannerImage: String? = nil, genres: [String]? = nil, averageScore: Int? = nil, popularity: Int? = nil) {
        self.id = id
        self.title = title
        self.type = type
        self.format = format
        self.status = status
        self.description = description
        self.startDate = startDate
        self.endDate = endDate
        self.season = season
        self.seasonYear = seasonYear
        self.episodes = episodes
        self.duration = duration
        self.chapters = chapters
        self.volumes = volumes
        self.coverImage = coverImage
        self.bannerImage = bannerImage
        self.genres = genres
        self.averageScore = averageScore
        self.popularity = popularity
    }
}

public struct MediaTitle: Codable, Equatable, Sendable {
    public let romaji: String?
    public let english: String?
    public let native: String?
    public let userPreferred: String?
    
    public init(romaji: String? = nil, english: String? = nil, native: String? = nil, userPreferred: String? = nil) {
        self.romaji = romaji
        self.english = english
        self.native = native
        self.userPreferred = userPreferred
    }
}

public struct MediaCoverImage: Codable, Equatable, Sendable {
    public let extraLarge: String?
    public let large: String?
    public let medium: String?
    public let color: String?
    
    public init(extraLarge: String? = nil, large: String? = nil, medium: String? = nil, color: String? = nil) {
        self.extraLarge = extraLarge
        self.large = large
        self.medium = medium
        self.color = color
    }
}
