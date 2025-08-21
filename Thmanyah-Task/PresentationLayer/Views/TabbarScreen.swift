//
//  TabbarScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//
import SwiftUI

struct TabbarScreen: View {
    @State var selectedTab: Int = 0
    
    init () {
        UITabBar.customizeAppearance()
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            SearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    TabbarScreen()
}
