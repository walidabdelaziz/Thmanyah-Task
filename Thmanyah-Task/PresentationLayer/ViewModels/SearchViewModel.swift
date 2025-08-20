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
    var results = [SectionEntity]()
    var isLoading = false

    private let useCase: SearchUseCase
    private var searchTask: Task<Void, Never>?

    init(useCase: SearchUseCase = SearchUseCaseImpl()) {
        self.useCase = useCase
    }

    private func onQueryChanged() {
        searchTask?.cancel()
        
        searchTask = Task { [weak self] in
            try? await Task.sleep(nanoseconds: 200_000_000)
            guard let self, !Task.isCancelled, !query.isEmpty else { return }
            await performSearch()
        }
    }

    func performSearch() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let response = try await useCase.execute()
            results = response.sections ?? []
        } catch {
            print("Error: \(error)")
        }
    }
}
