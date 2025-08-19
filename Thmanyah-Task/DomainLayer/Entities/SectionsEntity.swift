//
//  SectionsEntity.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 19/08/2025.
//

struct SectionsResponseEntity: Hashable {
    var sections: [SectionEntity]?
    var pagination: PaginationEntity?
}

struct PaginationEntity: Hashable {
    var nextPage: String?
    var totalPages: Int?
}

struct SectionEntity: Hashable {
    var name, type, contentType: String?
    var order: Int?
    var content: [ContentEntity]?
}

struct ContentEntity: Hashable {
    var podcastID, name, description: String?
    var avatarURL: String?
    var episodeCount, duration: Int?
    var language: String?
    var priority, popularityScore: Int?
    var score: Double?
    var podcastPopularityScore, podcastPriority: Int?
    var episodeID: String?
    var seasonNumber: Int?
    var episodeType: String?
    var podcastName: String?
    var authorName: String?
    var number: Int?
    var separatedAudioURL, audioURL: String?
    var releaseDate: String?
    var paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
    var paidIsExclusivePartially: Bool?
    var paidExclusiveStartTime: Int?
    var audiobookID: String?
    var articleID: String?
}

