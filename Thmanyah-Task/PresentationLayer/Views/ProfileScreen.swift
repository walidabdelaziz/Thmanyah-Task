//
//  ProfileScreen.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import SwiftUI
struct ProfileScreen: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    @AppStorage("appLanguage") private var appLanguage: String = AppLanguages.english.rawValue

    @State private var selectedTheme: AppThemes? = .dark
    @State private var selectedLanguage: AppLanguages? = .english
    @Binding var selectedTabbarIndex: Int

    var body: some View {
        VStack {
            headerView

            darkModeSection
                .padding(.horizontal)
            
            languageSection
                .padding(.horizontal)

            Spacer()
        }
        .foregroundStyle(.appWhite)
        .onAppear {
            selectedTheme = isDarkMode ? .dark : .light
            selectedLanguage = AppLanguages(rawValue: appLanguage) ?? .english
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .animation(.easeInOut, value: isDarkMode)
    }
    private var headerView: some View {
        Text("Profile")
            .font(.ibmSemiBold(.title2))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }

    private var darkModeSection: some View {
        HStack {
            Text("App Theme")
                .font(.ibmSemiBold(.headline))
                .frame(maxWidth: .infinity, alignment: .leading)

            
            CustomSegementControlView(
                items: AppThemes.allCases,
                selectedItem: $selectedTheme,
                label: { LocalizedStringKey($0.rawValue.capitalized) },
                onItemSelected: { theme in
                    selectedTheme = theme
                    updateStorage(for: theme)
                }
            )
        }
    }

    private var languageSection: some View {
        HStack {
            Text("Language")
                .font(.ibmSemiBold(.headline))
                .frame(maxWidth: .infinity, alignment: .leading)

            CustomSegementControlView(
                items: AppLanguages.allCases,
                selectedItem: $selectedLanguage,
                label: { LocalizedStringKey($0.title) },
                onItemSelected: { language in
                    selectedLanguage = language
                    updateLanguage(for: language)
                }
            )
        }
    }
    private func updateStorage(for theme: AppThemes) {
        isDarkMode = (theme == .dark)
    }

    private func updateLanguage(for language: AppLanguages) {
        appLanguage = language.rawValue
        selectedTabbarIndex = 0
    }
}

#Preview {
    @Previewable @State var selectedTab: Int = 2
    ProfileScreen(selectedTabbarIndex: $selectedTab)
}
