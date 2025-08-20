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
                    
              
                
                    
                }
                
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
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
