//
//  SearchViewModel.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI

@MainActor
@Observable class SearchViewModel {
    var query: String = "" {
        didSet { onQueryChanged() }
    }
    var sections = [SectionEntity]()
    private var allSections = [SectionEntity]()
    var isLoading = false

    private let useCase: SearchUseCase
    private var searchTask: Task<Void, Never>?

    init(useCase: SearchUseCase = SearchUseCaseImpl()) {
        self.useCase = useCase
    }

    private func onQueryChanged() {
        searchTask?.cancel()
        
        searchTask = Task { [weak self] in
            guard let self else { return }
            
            try? await Task.sleep(nanoseconds: 200_000_000)
            guard !Task.isCancelled else { return }

            if query.isEmpty {
                sections = allSections
            } else {
                await performSearch()
            }
        }
    }

    func performSearch() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let response = try await useCase.execute()
            let resultSections = response.sections ?? []
            
            if query.isEmpty {
                // cache full list
                allSections = resultSections
                sections = allSections
            } else {
                sections = resultSections
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
