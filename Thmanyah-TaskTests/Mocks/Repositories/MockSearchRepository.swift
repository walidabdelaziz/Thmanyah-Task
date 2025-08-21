//
//  MockSearchRepository.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task

final class MockSearchRepository: SearchRepository {
    var result: SectionsResponseEntity?
    func getSearchData() async throws -> SectionsResponseEntity {
        if let result = result { return result }
        throw NSError(domain: "MockSearchRepository", code: -1, userInfo: nil)
    }
}
