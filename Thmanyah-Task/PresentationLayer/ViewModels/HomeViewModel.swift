//
//  HomeViewModel.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

@MainActor
@Observable class HomeViewModel {
    
    var homeResponse = SectionsResponseEntity()
    var isLoading: Bool = false
    
    private let useCase: HomeUseCase
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func getSections() async {
        isLoading = true
        defer { isLoading = false }
        do {
            homeResponse = try await useCase.execute(page: 1)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func loadMore() async {
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        do {
            if let nextResponse = try await useCase.loadNextPage() {
                homeResponse.sections?.append(contentsOf: nextResponse.sections ?? [])
                homeResponse.pagination = nextResponse.pagination
            }
        } catch {
            print("Error loading more: \(error)")
        }
    }
    
    func refresh() async {
        useCase.resetPagination()
        await getSections()
    }
}
