import Foundation

/// Represents pagination information returned by AniList.
public struct PageInfo: Decodable, Equatable, Sendable {
    public let total: Int?
    public let perPage: Int?
    public let currentPage: Int?
    public let lastPage: Int?
    public let hasNextPage: Bool
    
    public enum CodingKeys: String, CodingKey {
        case total, perPage, currentPage, lastPage, hasNextPage
    }
    
    public init(total: Int? = nil, perPage: Int? = nil, currentPage: Int? = nil, lastPage: Int? = nil, hasNextPage: Bool = false) {
        self.total = total
        self.perPage = perPage
        self.currentPage = currentPage
        self.lastPage = lastPage
        self.hasNextPage = hasNextPage
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try container.decodeIfPresent(Int.self, forKey: .total)
        self.perPage = try container.decodeIfPresent(Int.self, forKey: .perPage)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.lastPage = try container.decodeIfPresent(Int.self, forKey: .lastPage)
        self.hasNextPage = try container.decodeIfPresent(Bool.self, forKey: .hasNextPage) ?? false
    }
}
