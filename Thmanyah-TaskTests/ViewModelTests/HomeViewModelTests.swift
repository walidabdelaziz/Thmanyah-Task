//
//  HomeViewModelTests.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task


@MainActor
final class HomeViewModelTests: XCTestCase {
    var useCase: MockHomeUseCase!
    var viewModel: HomeViewModel!

    override func setUp() async throws {
        try await super.setUp()
        useCase = MockHomeUseCase()
        viewModel = HomeViewModel(useCase: useCase)
    }

    func testGetSections() async {
        useCase.result = SectionsResponseEntity.mock()
        await viewModel.getSections()
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.results)
        XCTAssertEqual(viewModel.results?.sections?.count, 2)
    }

    func testLoadMore() async {
        useCase.result = SectionsResponseEntity.mock(pages: 2)
        await viewModel.getSections()
        await viewModel.loadMore()
        XCTAssertEqual(viewModel.results?.sections?.count, 4)
    }

    func testRefresh() async {
        useCase.result = SectionsResponseEntity.mock()
        await viewModel.refresh()
        XCTAssertFalse(viewModel.isRefreshing)
        XCTAssertEqual(viewModel.results?.sections?.count, 2)
    }
}
