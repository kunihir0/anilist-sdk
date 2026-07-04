import Foundation

public struct MediaListCollection: Decodable, Equatable, Sendable {
    public let lists: [MediaListGroup]?
    public let user: User?
    public let hasNextChunk: Bool?
    
    public init(
        lists: [MediaListGroup]? = nil,
        user: User? = nil,
        hasNextChunk: Bool? = nil
    ) {
        self.lists = lists
        self.user = user
        self.hasNextChunk = hasNextChunk
    }
}
