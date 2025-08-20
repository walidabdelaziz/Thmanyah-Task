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
extension ContentEntity {
    static var mock: ContentEntity {
        ContentEntity(
            podcastID: "podcast_123",
            name: "Swift Mastery",
            description: "A podcast about mastering Swift and iOS development.",
            avatarURL: Constants.SHARED_IMAGE,
            episodeCount: 42,
            duration: 3600,
            language: "en",
            priority: 1,
            popularityScore: 95,
            score: 4.8,
            podcastPopularityScore: 90,
            podcastPriority: 2,
            episodeID: "episode_456",
            seasonNumber: 1,
            episodeType: "full",
            podcastName: "Swift Dev Talks",
            authorName: "John Appleseed",
            number: 10,
            separatedAudioURL: "https://example.com/audio1.mp3",
            audioURL: "https://example.com/audio.mp3",
            releaseDate: "2023-05-10T10:00:00Z",
            paidIsEarlyAccess: false,
            paidIsNowEarlyAccess: false,
            paidIsExclusive: false,
            paidIsExclusivePartially: false,
            paidExclusiveStartTime: nil,
            audiobookID: nil,
            articleID: nil
        )
    }

    static var mocks: [ContentEntity] {
        (1...10).map { index in
            ContentEntity(
                podcastID: "podcast_\(index)",
                name: "Podcast \(index)",
                description: "This is the description for podcast \(index).",
                avatarURL: "https://picsum.photos/200/200?random=\(index)",
                episodeCount: Int.random(in: 10...100),
                duration: Int.random(in: 600...3600),
                language: "en",
                priority: index,
                popularityScore: Int.random(in: 50...100),
                score: Double.random(in: 3...5),
                podcastPopularityScore: Int.random(in: 50...100),
                podcastPriority: Int.random(in: 1...5),
                episodeID: "episode_\(index)",
                seasonNumber: Int.random(in: 1...5),
                episodeType: "full",
                podcastName: "Podcast Show \(index)",
                authorName: "Author \(index)",
                number: index,
                separatedAudioURL: "https://example.com/audio\(index)_part.mp3",
                audioURL: "https://example.com/audio\(index).mp3",
                releaseDate: "2025-01-\(String(format: "%02d", index))",
                paidIsEarlyAccess: Bool.random(),
                paidIsNowEarlyAccess: Bool.random(),
                paidIsExclusive: Bool.random(),
                paidIsExclusivePartially: Bool.random(),
                paidExclusiveStartTime: nil,
                audiobookID: nil,
                articleID: nil
            )
        }
    }
}


