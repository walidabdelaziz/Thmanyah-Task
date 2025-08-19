//
//  HomeRepository.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

protocol HomeRepository{
    func getHomeSections(page: Int) async throws -> SectionsResponseEntity
}
class HomeRepositoryImpl: HomeRepository{
    private let service: HomeService
    init(service: HomeService = HomeServiceImpl()) {
        self.service = service
    }

    func getHomeSections(page: Int) async throws -> SectionsResponseEntity {
        return try await service.getHomeSections(page: page).toDomain()
    }
}
