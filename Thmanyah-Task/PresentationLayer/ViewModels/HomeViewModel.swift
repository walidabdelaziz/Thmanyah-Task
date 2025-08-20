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
            var response = try await useCase.execute(page: 1)
            // Sort sections by order
            response.sections = response.sections?.sorted { ($0.order ?? 0) < ($1.order ?? 0) }
            homeResponse = response
        } catch {
            print("Error: \(error)")
        }
    }
    
    func loadMore() async {
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        do {
            if var nextResponse = try await useCase.loadNextPage() {
                // Sort the new page sections by order
                nextResponse.sections = nextResponse.sections?.sorted { ($0.order ?? 0) < ($1.order ?? 0) }
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
