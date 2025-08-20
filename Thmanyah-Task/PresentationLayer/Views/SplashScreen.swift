//
//  SplashScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var navigateToMainScreen: Bool = false

    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Image("thmanyah_logo")
            }
            .navigationDestination(isPresented: $navigateToMainScreen) {
                TabbarScreen()
            }
        }
        .onAppear {
            Task {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                navigateToMainScreen = true
            }
        }
    }
}

#Preview {
    SplashScreen()
}
