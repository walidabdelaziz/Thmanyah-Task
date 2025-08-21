//
//  MockHomeUseCase.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task

final class MockHomeUseCase: HomeUseCase {
    var result: SectionsResponseEntity?
    private(set) var currentPage = 1
    private(set) var totalPages: Int? = nil
    
    func execute(page: Int) async throws -> SectionsResponseEntity {
        currentPage = page
        totalPages = result?.pagination?.totalPages
        if let result = result { return result }
        throw NSError(domain: "MockHomeUseCase", code: -1, userInfo: nil)
    }
    
    func loadNextPage() async throws -> SectionsResponseEntity? {
        guard totalPages == nil || currentPage < (totalPages ?? 0) else { return nil }
        currentPage += 1
        return result
    }
    
    func resetPagination() {
        currentPage = 1
        totalPages = nil
    }
}
