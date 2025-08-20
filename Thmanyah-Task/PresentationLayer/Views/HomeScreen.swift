//
//  HomeScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct HomeScreen: View {
    @State private var vm = HomeViewModel(useCase: HomeUseCaseImpl())
    
    var body: some View {
        ZStack {
            Color.appBlack.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    headerView
                    
                    if let sections = vm.homeResponse.sections {
                        ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                            SectionView(section: section)
                                .onAppear {
                                    if index == sections.count - 1 {
                                        Task {
                                            await vm.loadMore()
                                        }
                                    }
                                }
                        }
                    }
                    
                    if vm.isLoading {
                        ProgressView("Loading more...")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                    }
                }
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await vm.getSections()
        }
        .refreshable {
            await vm.refresh()
        }
    }
    
    private var headerView: some View {
        HomeHeaderView(
            title: "Welcome, Walid",
            notificationCount: 4,
            onNotificationPressed: {}
        )
        .padding()
    }
}

#Preview {
    HomeScreen()
}
