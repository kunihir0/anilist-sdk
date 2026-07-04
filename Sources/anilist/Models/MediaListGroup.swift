import Foundation

public struct MediaListGroup: Decodable, Equatable, Sendable {
    public let entries: [MediaList]?
    public let name: String?
    public let isCustomList: Bool?
    public let isSplitCompletedList: Bool?
    public let status: MediaListStatus?
    
    public init(
        entries: [MediaList]? = nil,
        name: String? = nil,
        isCustomList: Bool? = nil,
        isSplitCompletedList: Bool? = nil,
        status: MediaListStatus? = nil
    ) {
        self.entries = entries
        self.name = name
        self.isCustomList = isCustomList
        self.isSplitCompletedList = isSplitCompletedList
        self.status = status
    }
}
