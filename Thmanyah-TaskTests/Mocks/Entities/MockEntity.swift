//
//  MockEntity.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task

extension SectionsResponseEntity {
    static func mock(sectionsCount: Int = 2, pages: Int? = 1) -> SectionsResponseEntity {
        let sections = (1...sectionsCount).map { i in
            SectionEntity(
                name: "Section \(i)",
                type: "type\(i)",
                contentType: "contentType\(i)",
                order: i,
                content: [
                    ContentEntity(
                        podcastID: "podcast\(i)",
                        name: "Content \(i)",
                        description: "Description \(i)",
                        avatarURL: "https://example.com/avatar\(i).png",
                        episodeCount: i * 10,
                        duration: 30,
                        language: "en",
                        priority: 1,
                        popularityScore: 100,
                        score: 50.0,
                        podcastPopularityScore: 80,
                        podcastPriority: 1,
                        episodeID: "episode\(i)",
                        seasonNumber: 1,
                        episodeType: "audio",
                        podcastName: "Podcast \(i)",
                        authorName: "Author \(i)",
                        number: i,
                        separatedAudioURL: "https://example.com/audio\(i).mp3",
                        audioURL: "https://example.com/audio\(i).mp3",
                        releaseDate: "2025-08-21",
                        paidIsEarlyAccess: false,
                        paidIsNowEarlyAccess: false,
                        paidIsExclusive: false,
                        paidIsExclusivePartially: false,
                        paidExclusiveStartTime: 0,
                        audiobookID: nil,
                        articleID: nil
                    )
                ]
            )
        }
        let pagination = PaginationEntity(nextPage: nil, totalPages: pages)
        return SectionsResponseEntity(sections: sections, pagination: pagination)
    }
}
