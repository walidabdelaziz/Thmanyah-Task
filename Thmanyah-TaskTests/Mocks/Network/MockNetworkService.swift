//
//  MockNetworkService.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 21/08/2025.
//

import XCTest
@testable import Thmanyah_Task
import Alamofire

final class MockNetworkService: NetworkService {
    var result: Result<SectionsResponseDTO, Error>?
    
    func request<T: Decodable>(url: String, method: HTTPMethod, params: Parameters?, headers: [String : String], of type: T.Type) async throws -> T {
        
        if let result = result {
            switch result {
            case .success(let value):
                if let casted = value as? T {
                    return casted
                } else {
                    fatalError("Cannot cast \(value) to \(T.self)")
                }
            case .failure(let error):
                throw error
            }
        } else {
            fatalError("Result not set")
        }
    }
}
