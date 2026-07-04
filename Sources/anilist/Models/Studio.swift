import Foundation

public struct Studio: Codable, Equatable, Sendable {
    public let id: Int
    public let name: String
    public let isAnimationStudio: Bool
    public let siteUrl: String?
    public let isFavourite: Bool
    public let favourites: Int?
    
    public init(id: Int, name: String, isAnimationStudio: Bool, siteUrl: String? = nil, isFavourite: Bool, favourites: Int? = nil) {
        self.id = id
        self.name = name
        self.isAnimationStudio = isAnimationStudio
        self.siteUrl = siteUrl
        self.isFavourite = isFavourite
        self.favourites = favourites
    }
}
