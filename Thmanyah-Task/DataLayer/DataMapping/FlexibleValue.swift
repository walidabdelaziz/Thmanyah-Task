//
//  FlexibleValue.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//


import Foundation

enum FlexibleValue: Codable {
    case int(Int)
    case string(String)
    case double(Double)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let intValue = try? container.decode(Int.self) {
            self = .int(intValue)
        } else if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else if let doubleValue = try? container.decode(Double.self) {
            self = .double(doubleValue)
        } else {
            throw DecodingError.typeMismatch(
                FlexibleValue.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Value cannot be decoded as Int, String, or Double"
                )
            )
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        }
    }
}

extension FlexibleValue {
    var intValue: Int? {
        switch self {
        case .int(let v): return v
        case .string(let v): return Int(v)
        case .double(let v): return Int(v)
        }
    }

    var stringValue: String {
        switch self {
        case .int(let v): return String(v)
        case .string(let v): return v
        case .double(let v): return String(v)
        }
    }

    var doubleValue: Double? {
        switch self {
        case .int(let v): return Double(v)
        case .string(let v): return Double(v)
        case .double(let v): return v
        }
    }
}
