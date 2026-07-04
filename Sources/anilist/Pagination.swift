import Foundation

/// Represents pagination information returned by AniList.
public struct PageInfo: Decodable, Equatable, Sendable {
    public let total: Int?
    public let perPage: Int?
    public let currentPage: Int?
    public let lastPage: Int?
    public let hasNextPage: Bool?
    
    public init(total: Int? = nil, perPage: Int? = nil, currentPage: Int? = nil, lastPage: Int? = nil, hasNextPage: Bool? = nil) {
        self.total = total
        self.perPage = perPage
        self.currentPage = currentPage
        self.lastPage = lastPage
        self.hasNextPage = hasNextPage
    }
}
