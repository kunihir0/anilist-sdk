import Foundation

public struct User: Codable, Equatable, Sendable {
    public let id: Int
    public let name: String
    public let avatar: UserAvatar?
    
    public init(id: Int, name: String, avatar: UserAvatar? = nil) {
        self.id = id
        self.name = name
        self.avatar = avatar
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
