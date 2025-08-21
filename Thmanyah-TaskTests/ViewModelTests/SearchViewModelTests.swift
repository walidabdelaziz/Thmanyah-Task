//
//  SearchViewModelTests.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task


@MainActor
final class SearchViewModelTests: XCTestCase {
    var useCase: MockSearchUseCase!
    var viewModel: SearchViewModel!

    override func setUp() async throws {
        try await super.setUp()
        useCase = MockSearchUseCase()
        viewModel = SearchViewModel(useCase: useCase)
    }

    func testPerformSearchEmptyQuery() async {
        useCase.result = SectionsResponseEntity.mock()
        viewModel.query = ""
        await viewModel.performSearch()
        XCTAssertEqual(viewModel.sections.count, 2)
    }

    func testPerformSearchWithQuery() async {
        useCase.result = SectionsResponseEntity.mock()
        viewModel.query = "test"
        await viewModel.performSearch()
        XCTAssertEqual(viewModel.sections.count, 2)
    }
}

