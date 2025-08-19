//
//  Extensions.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//
import SwiftUI

extension Font {
    static func ibm(_ weight: IBMFontWeight, textStyle: TextStyle) -> Font {
        .custom(weight.rawValue, size: UIFont.preferredFont(forTextStyle: textStyle.toUIFontTextStyle()).pointSize)
    }
    
    static func ibmRegular(_ textStyle: TextStyle) -> Font {
        ibm(.regular, textStyle: textStyle)
    }
    
    static func ibmMedium(_ textStyle: TextStyle) -> Font {
        ibm(.medium, textStyle: textStyle)
    }
    
    static func ibmSemiBold(_ textStyle: TextStyle) -> Font {
        ibm(.semiBold, textStyle: textStyle)
    }
    
    static func ibmBold(_ textStyle: TextStyle) -> Font {
        ibm(.bold, textStyle: textStyle)
    }
    
    static func ibmExtraLight(_ textStyle: TextStyle) -> Font {
        ibm(.extraLight, textStyle: textStyle)
    }
    
    static func ibmLight(_ textStyle: TextStyle) -> Font {
        ibm(.light, textStyle: textStyle)
    }
    
    static func ibmThin(_ textStyle: TextStyle) -> Font {
        ibm(.thin, textStyle: textStyle)
    }
    static func ibmText(_ textStyle: TextStyle) -> Font {
        ibm(.text, textStyle: textStyle)
    }
}

enum IBMFontWeight: String {
    case regular = "IBMPlexSansArabic"
    case medium = "IBMPlexSansArabic-Medium"
    case semiBold = "IBMPlexSansArabic-SemiBold"
    case bold = "IBMPlexSansArabic-Bold"
    case extraLight = "IBMPlexSansArabic-ExtraLight"
    case light = "IBMPlexSansArabic-Light"
    case thin = "IBMPlexSansArabic-Thin"
    case text = "IBMPlexSansArabic-Text"
}

private extension Font.TextStyle {
    func toUIFontTextStyle() -> UIFont.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title: return .title1
        case .title2: return .title2
        case .title3: return .title3
        case .headline: return .headline
        case .subheadline: return .subheadline
        case .body: return .body
        case .callout: return .callout
        case .footnote: return .footnote
        case .caption: return .caption1
        case .caption2: return .caption2
        @unknown default: return .body
        }
    }
}
