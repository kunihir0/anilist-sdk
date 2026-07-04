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
    public let isFavourite: Bool
    public let siteUrl: String?
    public let favourites: Int?
    
    public enum CodingKeys: String, CodingKey {
        case id, name, image, description, gender, dateOfBirth, age, bloodType, isFavourite, siteUrl, favourites
    }
    
    public init(id: Int, name: CharacterName? = nil, image: CharacterImage? = nil, description: String? = nil, gender: String? = nil, dateOfBirth: FuzzyDate? = nil, age: String? = nil, bloodType: String? = nil, isFavourite: Bool = false, siteUrl: String? = nil, favourites: Int? = nil) {
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(CharacterName.self, forKey: .name)
        self.image = try container.decodeIfPresent(CharacterImage.self, forKey: .image)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.dateOfBirth = try container.decodeIfPresent(FuzzyDate.self, forKey: .dateOfBirth)
        self.age = try container.decodeIfPresent(String.self, forKey: .age)
        self.bloodType = try container.decodeIfPresent(String.self, forKey: .bloodType)
        self.isFavourite = try container.decodeIfPresent(Bool.self, forKey: .isFavourite) ?? false
        self.siteUrl = try container.decodeIfPresent(String.self, forKey: .siteUrl)
        self.favourites = try container.decodeIfPresent(Int.self, forKey: .favourites)
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
