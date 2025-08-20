//
//  Thmanyah_TaskApp.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 19/08/2025.
//

import SwiftUI

@main
struct Thmanyah_TaskApp: App {
    init() {
        let refreshControlAppearance = UIRefreshControl.appearance()
        refreshControlAppearance.tintColor = .appRed
    }

    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
