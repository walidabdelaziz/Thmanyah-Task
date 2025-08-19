//
//  HomeSectionsUseCase.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

protocol HomeUseCase {
    func execute(page: Int) async throws -> SectionsResponseEntity
    func loadNextPage() async throws -> SectionsResponseEntity?
    func resetPagination()
}

class HomeUseCaseImpl: HomeUseCase {
    
    private let repository: HomeRepository
    private var currentPage = 1
    private var totalPages: Int? = nil
    
    init(repository: HomeRepository = HomeRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> SectionsResponseEntity {
        let response = try await repository.getHomeSections(page: page)
        currentPage = page
        totalPages = response.pagination?.totalPages
        return response
    }
    
    func loadNextPage() async throws -> SectionsResponseEntity? {
        guard totalPages == nil || currentPage < (totalPages ?? 0) else { return nil }
        
        let nextPage = currentPage + 1
        let response = try await repository.getHomeSections(page: nextPage)
        
        currentPage = nextPage
        totalPages = response.pagination?.totalPages
        
        return response
    }
    
    func resetPagination() {
        currentPage = 1
        totalPages = nil
    }
}
