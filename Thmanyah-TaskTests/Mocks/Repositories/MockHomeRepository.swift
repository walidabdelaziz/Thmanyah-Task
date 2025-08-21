//
//  MockHomeRepository.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task

final class MockHomeRepository: HomeRepository {
    var result: SectionsResponseEntity?
    func getHomeSections(page: Int) async throws -> SectionsResponseEntity {
        if let result = result { return result }
        throw NSError(domain: "MockHomeRepository", code: -1, userInfo: nil)
    }
}
