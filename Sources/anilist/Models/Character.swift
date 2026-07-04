import Foundation

public struct Character: Codable, Equatable, Sendable {
    public let id: Int
    public let name: CharacterName?
    public let image: CharacterImage?
    public let description: String?
    public let gender: String?
    public let dateOfBirth: FuzzyDate?
    public let age: String?
    public let bloodType: String?
    public let isFavourite: Bool?
    public let siteUrl: String?
    public let favourites: Int?
    
    public init(id: Int, name: CharacterName? = nil, image: CharacterImage? = nil, description: String? = nil, gender: String? = nil, dateOfBirth: FuzzyDate? = nil, age: String? = nil, bloodType: String? = nil, isFavourite: Bool? = nil, siteUrl: String? = nil, favourites: Int? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.description = description
        self.gender = gender
        self.dateOfBirth = dateOfBirth
        self.age = age
        self.bloodType = bloodType
        self.isFavourite = isFavourite
        self.siteUrl = siteUrl
        self.favourites = favourites
    }
}

public struct CharacterName: Codable, Equatable, Sendable {
    public let first: String?
    public let middle: String?
    public let last: String?
    public let full: String?
    public let native: String?
    public let userPreferred: String?
    public let alternative: [String]?
    public let alternativeSpoiler: [String]?
    
    public init(first: String? = nil, middle: String? = nil, last: String? = nil, full: String? = nil, native: String? = nil, userPreferred: String? = nil, alternative: [String]? = nil, alternativeSpoiler: [String]? = nil) {
        self.first = first
        self.middle = middle
        self.last = last
        self.full = full
        self.native = native
        self.userPreferred = userPreferred
        self.alternative = alternative
        self.alternativeSpoiler = alternativeSpoiler
    }
}

public struct CharacterImage: Codable, Equatable, Sendable {
    public let large: String?
    public let medium: String?
    
    public init(large: String? = nil, medium: String? = nil) {
        self.large = large
        self.medium = medium
    }
}
