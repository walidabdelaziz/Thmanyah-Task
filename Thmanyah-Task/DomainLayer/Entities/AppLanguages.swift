//
//  AppLanguages.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

enum AppLanguages: String, CaseIterable {
    case english = "en"
    case arabic = "ar"
    
    var title: String {
        switch self {
        case .english:
            return "English"
        case .arabic:
            return "عربي"
        }
    }
}

