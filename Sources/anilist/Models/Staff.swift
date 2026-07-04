import Foundation

public struct Staff: Codable, Equatable, Sendable {
    public let id: Int
    public let name: StaffName?
    public let languageV2: String?
    public let image: StaffImage?
    public let description: String?
    public let primaryOccupations: [String]?
    public let gender: String?
    public let dateOfBirth: FuzzyDate?
    public let dateOfDeath: FuzzyDate?
    public let age: Int?
    public let yearsActive: [Int]?
    public let homeTown: String?
    public let bloodType: String?
    public let isFavourite: Bool
    public let isFavouriteBlocked: Bool
    public let siteUrl: String?
    public let favourites: Int?
    
    public enum CodingKeys: String, CodingKey {
        case id, name, languageV2, image, description, primaryOccupations, gender, dateOfBirth, dateOfDeath, age, yearsActive, homeTown, bloodType, isFavourite, isFavouriteBlocked, siteUrl, favourites
    }
    
    public init(id: Int, name: StaffName? = nil, languageV2: String? = nil, image: StaffImage? = nil, description: String? = nil, primaryOccupations: [String]? = nil, gender: String? = nil, dateOfBirth: FuzzyDate? = nil, dateOfDeath: FuzzyDate? = nil, age: Int? = nil, yearsActive: [Int]? = nil, homeTown: String? = nil, bloodType: String? = nil, isFavourite: Bool = false, isFavouriteBlocked: Bool = false, siteUrl: String? = nil, favourites: Int? = nil) {
        self.id = id
        self.name = name
        self.languageV2 = languageV2
        self.image = image
        self.description = description
        self.primaryOccupations = primaryOccupations
        self.gender = gender
        self.dateOfBirth = dateOfBirth
        self.dateOfDeath = dateOfDeath
        self.age = age
        self.yearsActive = yearsActive
        self.homeTown = homeTown
        self.bloodType = bloodType
        self.isFavourite = isFavourite
        self.isFavouriteBlocked = isFavouriteBlocked
        self.siteUrl = siteUrl
        self.favourites = favourites
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(StaffName.self, forKey: .name)
        self.languageV2 = try container.decodeIfPresent(String.self, forKey: .languageV2)
        self.image = try container.decodeIfPresent(StaffImage.self, forKey: .image)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.primaryOccupations = try container.decodeIfPresent([String].self, forKey: .primaryOccupations)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.dateOfBirth = try container.decodeIfPresent(FuzzyDate.self, forKey: .dateOfBirth)
        self.dateOfDeath = try container.decodeIfPresent(FuzzyDate.self, forKey: .dateOfDeath)
        self.age = try container.decodeIfPresent(Int.self, forKey: .age)
        self.yearsActive = try container.decodeIfPresent([Int].self, forKey: .yearsActive)
        self.homeTown = try container.decodeIfPresent(String.self, forKey: .homeTown)
        self.bloodType = try container.decodeIfPresent(String.self, forKey: .bloodType)
        self.isFavourite = try container.decodeIfPresent(Bool.self, forKey: .isFavourite) ?? false
        self.isFavouriteBlocked = try container.decodeIfPresent(Bool.self, forKey: .isFavouriteBlocked) ?? false
        self.siteUrl = try container.decodeIfPresent(String.self, forKey: .siteUrl)
        self.favourites = try container.decodeIfPresent(Int.self, forKey: .favourites)
    }
}

public struct StaffName: Codable, Equatable, Sendable {
    public let first: String?
    public let middle: String?
    public let last: String?
    public let full: String?
    public let native: String?
    public let userPreferred: String?
    public let alternative: [String]?
    
    public init(first: String? = nil, middle: String? = nil, last: String? = nil, full: String? = nil, native: String? = nil, userPreferred: String? = nil, alternative: [String]? = nil) {
        self.first = first
        self.middle = middle
        self.last = last
        self.full = full
        self.native = native
        self.userPreferred = userPreferred
        self.alternative = alternative
    }
}

public struct StaffImage: Codable, Equatable, Sendable {
    public let large: String?
    public let medium: String?
    
    public init(large: String? = nil, medium: String? = nil) {
        self.large = large
        self.medium = medium
    }
}
