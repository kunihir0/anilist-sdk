import Foundation

public enum MediaType: String, Codable, Equatable, Sendable {
    case anime = "ANIME"
    case manga = "MANGA"
}

public enum MediaFormat: String, Codable, Equatable, Sendable {
    case tv = "TV"
    case tvShort = "TV_SHORT"
    case movie = "MOVIE"
    case special = "SPECIAL"
    case ova = "OVA"
    case ona = "ONA"
    case music = "MUSIC"
    case manga = "MANGA"
    case novel = "NOVEL"
    case oneShot = "ONE_SHOT"
}

public enum MediaStatus: String, Codable, Equatable, Sendable {
    case finished = "FINISHED"
    case releasing = "RELEASING"
    case notYetReleased = "NOT_YET_RELEASED"
    case cancelled = "CANCELLED"
    case hiatus = "HIATUS"
}

public enum MediaSeason: String, Codable, Equatable, Sendable {
    case winter = "WINTER"
    case spring = "SPRING"
    case summer = "SUMMER"
    case fall = "FALL"
}

public enum MediaSort: String, Codable, Equatable, Sendable {
    case id = "ID"
    case idDesc = "ID_DESC"
    case titleRomaji = "TITLE_ROMAJI"
    case titleRomajiDesc = "TITLE_ROMAJI_DESC"
    case titleEnglish = "TITLE_ENGLISH"
    case titleEnglishDesc = "TITLE_ENGLISH_DESC"
    case titleNative = "TITLE_NATIVE"
    case titleNativeDesc = "TITLE_NATIVE_DESC"
    case type = "TYPE"
    case typeDesc = "TYPE_DESC"
    case format = "FORMAT"
    case formatDesc = "FORMAT_DESC"
    case startDate = "START_DATE"
    case startDateDesc = "START_DATE_DESC"
    case endDate = "END_DATE"
    case endDateDesc = "END_DATE_DESC"
    case score = "SCORE"
    case scoreDesc = "SCORE_DESC"
    case popularity = "POPULARITY"
    case popularityDesc = "POPULARITY_DESC"
    case trending = "TRENDING"
    case trendingDesc = "TRENDING_DESC"
    case episodes = "EPISODES"
    case episodesDesc = "EPISODES_DESC"
    case duration = "DURATION"
    case durationDesc = "DURATION_DESC"
    case status = "STATUS"
    case statusDesc = "STATUS_DESC"
    case chapters = "CHAPTERS"
    case chaptersDesc = "CHAPTERS_DESC"
    case volumes = "VOLUMES"
    case volumesDesc = "VOLUMES_DESC"
    case updatedAt = "UPDATED_AT"
    case updatedAtDesc = "UPDATED_AT_DESC"
    case searchMatch = "SEARCH_MATCH"
    case favourites = "FAVOURITES"
    case favouritesDesc = "FAVOURITES_DESC"
}

public enum MediaListStatus: String, Codable, Equatable, Sendable {
    case current = "CURRENT"
    case planning = "PLANNING"
    case completed = "COMPLETED"
    case dropped = "DROPPED"
    case paused = "PAUSED"
    case repeating = "REPEATING"
}
