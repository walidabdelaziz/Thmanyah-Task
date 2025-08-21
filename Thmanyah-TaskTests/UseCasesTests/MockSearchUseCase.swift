//
//  MockSearchUseCase.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task

final class MockSearchUseCase: SearchUseCase {
    var result: SectionsResponseEntity?
    func execute() async throws -> SectionsResponseEntity {
        if let result = result { return result }
        throw NSError(domain: "MockSearchUseCase", code: -1, userInfo: nil)
    }
}
