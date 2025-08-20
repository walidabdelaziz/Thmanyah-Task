//
//  SectionsDTO+Mapping.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 19/08/2025.
//

struct SectionsResponseDTO: Codable {
    var sections: [SectionDTO]?
    var pagination: PaginationDTO?
}

struct PaginationDTO: Codable {
    var nextPage: String?
    var totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}

struct SectionDTO: Codable {
    var name, type, contentType: String?
    var order: FlexibleValue?
    var content: [ContentDTO]?

    enum CodingKeys: String, CodingKey {
        case name, type
        case contentType = "content_type"
        case order, content
    }
}

struct ContentDTO: Codable {
    var podcastID, name, description: String?
    var avatarURL: String?
    var episodeCount, duration: FlexibleValue?
    var language: String?
    var priority, popularityScore: FlexibleValue?
    var score: FlexibleValue?
    var podcastPopularityScore, podcastPriority: FlexibleValue?
    var episodeID: String?
    var seasonNumber: FlexibleValue?
    var episodeType: String?
    var podcastName: String?
    var authorName: String?
    var number: FlexibleValue?
    var separatedAudioURL, audioURL: String?
    var releaseDate: String?
    var paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
    var paidIsExclusivePartially: Bool?
    var paidExclusiveStartTime: FlexibleValue?
    var audiobookID: String?
    var articleID: String?

    enum CodingKeys: String, CodingKey {
        case podcastID = "podcast_id"
        case name, description
        case avatarURL = "avatar_url"
        case episodeCount = "episode_count"
        case duration, language, priority, popularityScore, score, podcastPopularityScore, podcastPriority
        case episodeID = "episode_id"
        case seasonNumber = "season_number"
        case episodeType = "episode_type"
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case number
        case separatedAudioURL = "separated_audio_url"
        case audioURL = "audio_url"
        case releaseDate = "release_date"
        case paidIsEarlyAccess = "paid_is_early_access"
        case paidIsNowEarlyAccess = "paid_is_now_early_access"
        case paidIsExclusive = "paid_is_exclusive"
        case audiobookID = "audiobook_id"
        case articleID = "article_id"
    }
}


extension SectionsResponseDTO{
    func toDomain() -> SectionsResponseEntity{
        SectionsResponseEntity(
            sections: sections?.map{$0.toDomain()},
            pagination: pagination?.toDomain()
        )
    }
}
extension PaginationDTO{
    func toDomain() -> PaginationEntity{
        PaginationEntity(
            nextPage: nextPage,
            totalPages: totalPages
        )
    }
}
extension SectionDTO{
    func toDomain() -> SectionEntity{
        SectionEntity(
            name: name,
            type: type,
            contentType: contentType,
            order: order?.intValue ?? 0,
            content: content?.map{$0.toDomain()}
        )
    }
}
extension ContentDTO{
    func toDomain() -> ContentEntity{
        ContentEntity(
            podcastID: podcastID,
            name: name,
            description: description,
            avatarURL: avatarURL,
            episodeCount: episodeCount?.intValue,
            duration: duration?.intValue,
            language: language,
            priority: priority?.intValue,
            popularityScore: popularityScore?.intValue,
            score: score?.doubleValue,
            podcastPopularityScore: podcastPopularityScore?.intValue,
            podcastPriority: podcastPriority?.intValue,
            episodeID: episodeID,
            seasonNumber: seasonNumber?.intValue,
            episodeType: episodeType,
            podcastName: podcastName,
            authorName: authorName,
            number: number?.intValue,
            separatedAudioURL: separatedAudioURL,
            audioURL: audioURL,
            releaseDate: releaseDate,
            paidIsEarlyAccess: paidIsEarlyAccess,
            paidIsNowEarlyAccess: paidIsNowEarlyAccess,
            paidIsExclusive: paidIsExclusive,
            paidIsExclusivePartially: paidIsExclusivePartially,
            paidExclusiveStartTime: paidExclusiveStartTime?.intValue,
            audiobookID: audiobookID,
            articleID: articleID,
        )
    }
}
