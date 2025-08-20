//
//  SearchUseCase.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

protocol SearchUseCase {
    func execute() async throws -> SectionsResponseEntity
}

class SearchUseCaseImpl: SearchUseCase {
    private let repository: SearchRepository
    init(repository: SearchRepository = SearchRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> SectionsResponseEntity {
       return try await repository.getSearchData()
    }
}
