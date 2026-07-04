import Foundation

public struct MediaList: Decodable, Equatable, Sendable {
    public let id: Int
    public let userId: Int
    public let mediaId: Int
    public let status: MediaListStatus?
    public let score: Double?
    public let progress: Int?
    public let progressVolumes: Int?
    public let `repeat`: Int?
    public let priority: Int?
    public let `private`: Bool?
    public let notes: String?
    public let hiddenFromStatusLists: Bool?
    public let startedAt: FuzzyDate?
    public let completedAt: FuzzyDate?
    public let updatedAt: Int?
    public let createdAt: Int?
    public let media: Media?
    public let user: User?
    
    public init(
        id: Int,
        userId: Int,
        mediaId: Int,
        status: MediaListStatus? = nil,
        score: Double? = nil,
        progress: Int? = nil,
        progressVolumes: Int? = nil,
        `repeat`: Int? = nil,
        priority: Int? = nil,
        `private`: Bool? = nil,
        notes: String? = nil,
        hiddenFromStatusLists: Bool? = nil,
        startedAt: FuzzyDate? = nil,
        completedAt: FuzzyDate? = nil,
        updatedAt: Int? = nil,
        createdAt: Int? = nil,
        media: Media? = nil,
        user: User? = nil
    ) {
        self.id = id
        self.userId = userId
        self.mediaId = mediaId
        self.status = status
        self.score = score
        self.progress = progress
        self.progressVolumes = progressVolumes
        self.`repeat` = `repeat`
        self.priority = priority
        self.`private` = `private`
        self.notes = notes
        self.hiddenFromStatusLists = hiddenFromStatusLists
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.media = media
        self.user = user
    }
}
