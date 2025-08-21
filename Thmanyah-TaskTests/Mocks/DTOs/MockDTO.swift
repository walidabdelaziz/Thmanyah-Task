//
//  MockDTO.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//
import XCTest
@testable import Thmanyah_Task

extension SectionsResponseDTO {
    static func mock(sectionsCount: Int = 2, totalPages: Int? = 1) -> SectionsResponseDTO {
        let sections = (1...sectionsCount).map { i in
            SectionDTO(
                name: "Section \(i)",
                type: "type\(i)",
                contentType: "contentType\(i)",
                order: FlexibleValue.int(i),
                content: [
                    ContentDTO(
                        podcastID: "podcast\(i)",
                        name: "Content \(i)",
                        description: "Description \(i)",
                        avatarURL: "https://example.com/avatar\(i).png",
                        episodeCount: .int(i * 10),
                        duration: .int(30),
                        language: "en",
                        priority: .int(1),
                        popularityScore: .int(100),
                        score: .double(50.0),
                        podcastPopularityScore: .int(80),
                        podcastPriority: .int(1),
                        episodeID: "episode\(i)",
                        seasonNumber: .int(1),
                        episodeType: "audio",
                        podcastName: "Podcast \(i)",
                        authorName: "Author \(i)",
                        number: .int(i),
                        separatedAudioURL: "https://example.com/audio\(i).mp3",
                        audioURL: "https://example.com/audio\(i).mp3",
                        releaseDate: "2025-08-21",
                        paidIsEarlyAccess: false,
                        paidIsNowEarlyAccess: false,
                        paidIsExclusive: false,
                        paidIsExclusivePartially: false,
                        paidExclusiveStartTime: .int(0),
                        audiobookID: nil,
                        articleID: nil
                    )
                ]
            )
        }
        let pagination = PaginationDTO(nextPage: nil, totalPages: totalPages)
        return SectionsResponseDTO(sections: sections, pagination: pagination)
    }
}
