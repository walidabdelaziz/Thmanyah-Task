//
//  MockHomeService.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task

final class MockHomeService: HomeService {
    var result: Result<SectionsResponseDTO, Error>?
    
    func getHomeSections(page: Int) async throws -> SectionsResponseDTO {
        switch result {
        case .success(let value): return value
        case .failure(let error): throw error
        case .none: fatalError("Result not set")
        }
    }
}
