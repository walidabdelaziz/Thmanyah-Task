//
//  SearchRepository.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

protocol SearchRepository{
    func getSearchData() async throws -> SectionsResponseEntity
}
class SearchRepositoryImpl: SearchRepository{
    private let service: SearchService
    init(service: SearchService = SearchServiceImpl()) {
        self.service = service
    }

    func getSearchData() async throws -> SectionsResponseEntity {
        return try await service.getSearchData().toDomain()
    }
}
