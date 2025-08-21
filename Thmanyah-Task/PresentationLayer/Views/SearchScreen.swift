//
//  SearchScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI

struct SearchScreen: View {
    @State private var vm = SearchViewModel(useCase: SearchUseCaseImpl())
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
            await vm.performSearch()
        }
        .overlay {
            if vm.isLoading {
                IndicatorLoaderView()
            }
        }
    }
    
    private var contentSections: some View {
        ForEach(Array(vm.sections.enumerated()), id: \.offset) { index, section in
            SectionView(section: section)
        }
    }
    
    private var headerView: some View {
        CustomTextFieldView(text: $vm.query, placeholder: "Search here")
        .padding()
    }
}


#Preview {
    SearchScreen()
}
