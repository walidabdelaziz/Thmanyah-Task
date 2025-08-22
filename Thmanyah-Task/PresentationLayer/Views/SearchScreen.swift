//
//  SearchScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI
import SwiftfulUI

struct SearchScreen: View {
    @State private var vm = SearchViewModel(useCase: SearchUseCaseImpl())
    @State var headerFrame: CGRect = .zero
    @State var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.appBlack.ignoresSafeArea()
            scrollViewContent
            headerView
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await vm.performSearch()
        }
        .overlay {
            if vm.isLoading {
                IndicatorLoaderView()
            }
            if vm.sections.isEmpty && vm.isLoading == false{
                ContentUnavailableView("No search results available, please try again later", systemImage: "magnifyingglass")
                    .foregroundStyle(Color.appWhite)
            }
        }
    }
    
    private var scrollViewContent: some View {
        ScrollViewWithOnScrollChanged(
            .vertical,
            showsIndicators: false) {
                LazyVStack(spacing: 16){
                    Rectangle()
                        .fill(.appBlack.opacity(0.000001))
                        .frame(height: headerFrame.height)
                    
                    contentSections
                }
                .padding(.bottom, 16)
                
            } onScrollChanged: { origin in
                scrollViewOffset = min(0, origin.y)
            }
    }
    private var contentSections: some View {
        ForEach(Array(vm.sections.enumerated()), id: \.offset) { index, section in
            ContentSectionView(section: section, showViewAllArrow: false)
        }
    }
    
    private var headerView: some View {
        CustomTextFieldView(text: $vm.query, placeholder: "Explore more")
        .padding()
        .readingFrame { frame in
            if headerFrame == .zero {
                headerFrame = frame
            }
        }
        .background(
            ZStack{
                if scrollViewOffset < -30{
                    MaterialBackgroundView(
                        material: .ultraThinMaterial,
                        brightness: -0.2
                    )
                }
            }
        )
        
    }
}


#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        SearchScreen()
    }
}
