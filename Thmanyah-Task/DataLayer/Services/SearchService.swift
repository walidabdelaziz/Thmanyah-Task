//
//  SearchService.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

protocol SearchService{
    func getSearchData() async throws -> SectionsResponseDTO
}
class SearchServiceImpl: SearchService{
    private let networkService: NetworkService
    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }

    func getSearchData() async throws -> SectionsResponseDTO {
        return try await networkService
            .request(
                url: Constants.SEARCH_SECTIONS,
                method: .get,
                params: nil,
                headers: [:],
                of: SectionsResponseDTO.self
            )
    }
}
