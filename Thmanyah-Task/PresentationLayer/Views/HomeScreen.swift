//
//  HomeScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct HomeScreen: View {
    @State private var vm = HomeViewModel(useCase: HomeUseCaseImpl())
    @AppStorage("appLanguage") private var appLanguage: String = "english"
    
    var body: some View {
        ZStack {
            Color.appBlack.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    headerView
                    
                    contentSections
                }
                .padding(.bottom, 16)
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await vm.getSections()
        }
        .refreshable {
            await vm.refresh()
        }
        .overlay {
            if vm.isLoading && !vm.isRefreshing {
                IndicatorLoaderView()
            }
        }
    }
    
    private var contentSections: some View {
        Group {
            if let sections = vm.results?.sections {
                ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                    ContentSectionView(section: section)
                        .onAppear {
                            if index == sections.count - 2 && !vm.isLoading {
                                Task {
                                    await vm.loadMore()
                                }
                            }
                        }
                }
            }
        }
    }
    
    private var headerView: some View {
        let name = "Walid"
        return HomeHeaderView(
            title: "Welcome \(name)",
            notificationCount: 4,
            onNotificationPressed: {}
        )
        .padding()
    }
}

#Preview {
    HomeScreen()
}
