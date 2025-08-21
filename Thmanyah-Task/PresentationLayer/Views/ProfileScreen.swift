//
//  ProfileScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI

struct ProfileScreen: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    @State private var selectedTheme: AppThemes? = .dark

    var body: some View {
        VStack{
            headerView
            
            darkModeSection
                .padding()
         
            
            Spacer()
        }
        .foregroundStyle(.appWhite)
        .onAppear{
            selectedTheme = isDarkMode ? .dark : .light
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .animation(.easeInOut, value: isDarkMode)
    }
    private func updateStorage(for theme: AppThemes) {
        switch theme {
        case .dark:
            isDarkMode = true
        case .light:
            isDarkMode = false
        }
    }
    private var headerView: some View {
        Text("Profile")
            .font(.ibmSemiBold(.title2))
            .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    private var darkModeSegementControl: some View {
        CustomSegementControlView(
            items: AppThemes.allCases,
            selectedItem: $selectedTheme,
            label: {$0.rawValue.capitalized},
            onItemSelected: { theme in
                selectedTheme = theme
                updateStorage(for: theme)
            }
        )
    }
    private var darkModeSection: some View {
        HStack{
            Text("Dark Mode")
                .font(.ibmSemiBold(.headline))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            darkModeSegementControl
        }
    }
}

#Preview {
    ProfileScreen()
}
