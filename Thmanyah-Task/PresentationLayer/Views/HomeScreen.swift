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
        ZStack{
            Color.appBlack.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVStack{
                    
                    headerView
                    
                    
                    if let sections = vm.homeResponse.sections {
                        ForEach(Array(sections.enumerated()), id: \.offset) { index, section in
                            VStack(alignment: .leading, spacing: 12) {
                                
                                // Section Title
                                Text(section.name ?? "No Title")
                                    .font(.ibmSemiBold(.title3))
                                    .foregroundStyle(.appWhite)
                                    .padding(.horizontal)
                                
                                // Horizontal ScrollView for items
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack(spacing: 12) {
                                        ForEach(section.content ?? [], id: \.self) { content in
                                            
                                            switch section.normalizedType {
                                   
                                            case "square":
                                                SquareContentCell(content: content)
                                                    .frame(width: UIScreen.main.bounds.width / 3.2)

                                            case "queue":
                                                QueueContentCell(content: content)
                                                    .frame(width: UIScreen.main.bounds.width * 0.75)

                                            default:
                                                EmptyView()
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .padding(.vertical, 8)
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
                    }
                }
                
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            Task { await vm.getSections() }
        }
        .refreshable {
            Task { await vm.refresh() }
        }
       
    }
    private var headerView: some View {
        HomeHeaderView(
            title: "Welcome, Walid",
            notificationCount: 4,
            onNotificationPressed: {
                
            }
        )
        .padding()
    }
}

#Preview {
    HomeScreen()
}
