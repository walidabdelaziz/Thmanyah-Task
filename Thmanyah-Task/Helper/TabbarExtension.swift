//
//  TabbarExtension.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//
import UIKit

extension UITabBar {
    static func customizeAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = UIColor.appDarkGray
        appearance.shadowColor = UIColor.black.withAlphaComponent(0.3)
        appearance.shadowImage = UIImage()
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.appLightGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.appLightGray,
            .font: UIFont(name: IBMFontWeight.regular.rawValue, size: 12) ?? .systemFont(ofSize: 12)
        ]
        
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.appRed
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.appRed,
            .font: UIFont(name: IBMFontWeight.medium.rawValue, size: 12) ?? .systemFont(ofSize: 12)
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

