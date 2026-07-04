import Foundation

public struct FuzzyDate: Codable, Equatable, Sendable {
    public let year: Int?
    public let month: Int?
    public let day: Int?
    
    public init(year: Int? = nil, month: Int? = nil, day: Int? = nil) {
        self.year = year
        self.month = month
        self.day = day
    }
}
