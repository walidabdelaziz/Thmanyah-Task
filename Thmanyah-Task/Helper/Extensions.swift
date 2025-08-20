//
//  Extensions.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//
import Foundation
import SwiftUI

extension Int {
    var asDurationReadable: String {
        let totalSeconds = self >= 10_000 ? self / 1000 : self
        let h = totalSeconds / 3600
        let m = (totalSeconds % 3600) / 60
        let s = totalSeconds % 60

        var parts: [String] = []
        if h > 0 { parts.append("\(h)h") }
        if m > 0 { parts.append("\(m)m") }
        if s > 0 { parts.append("\(s)s") }

        return parts.joined(separator: " ")
    }
}

extension String {
    func asTimeAgo() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        var date: Date? = formatter.date(from: self)
        if date == nil {
            formatter.formatOptions = [.withInternetDateTime]
            date = formatter.date(from: self)
        }

        guard let parsedDate = date else { return self }

        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: parsedDate, to: now)

        if calendar.isDateInToday(parsedDate) {
            if let hour = components.hour, hour > 0 {
                return "\(hour)h ago"
            } else if let minute = components.minute, minute > 0 {
                return "\(minute)m ago"
            } else {
                return "now"
            }
        } else if calendar.isDateInYesterday(parsedDate) {
            return "yesterday"
        } else if let day = components.day {
            if day > 30 {
                return "+30d ago"
            } else {
                return "\(day)d ago"
            }
        }
        return self
    }
    
    func cleanedHTML() -> String {
        var text = self

        text = text.replacingOccurrences(of: "\n", with: " ")
        text = text.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)

        if let data = text.data(using: .utf8) {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            if let attributed = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
                text = attributed.string
            }
        }
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
extension CGFloat {
    static func dynamicSize(
        scale: CGFloat = 0.3,
        min: CGFloat = 60,
        max: CGFloat = 150
    ) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let base = screenWidth * scale
        return Swift.min(Swift.max(base, min), max)
    }
}
