//
//  HomeService.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

protocol HomeService{
    func getHomeSections(page: Int) async throws -> SectionsResponseDTO
}
class HomeServiceImpl: HomeService{
    private let networkService: NetworkService
    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }

    func getHomeSections(page: Int) async throws -> SectionsResponseDTO {
        return try await networkService
            .request(
                url: "\(Constants.HOME_SECTIONS)?page=\(page)",
                method: .get,
                params: nil,
                headers: [:],
                of: SectionsResponseDTO.self
            )
    }
}
