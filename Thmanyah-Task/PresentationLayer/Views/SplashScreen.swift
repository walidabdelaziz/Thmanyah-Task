//
//  SplashScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var navigateToHomeScreen: Bool = false

    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Image("thmanyah_logo")
            }
            .navigationDestination(isPresented: $navigateToHomeScreen) {
                HomeScreen()
            }
        }
        .onAppear {
            Task {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                navigateToHomeScreen = true
            }
        }
    }
}

#Preview {
    SplashScreen()
}
