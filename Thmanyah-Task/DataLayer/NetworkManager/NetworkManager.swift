//
//  NetworkManager.swift
//  Thmanyah-Task
//
//  Created by Walid Ahmed on 20/08/2025.
//
import Alamofire

protocol NetworkService{
    func request<T: Decodable>(
        url: String,
        method: HTTPMethod,
        params: Parameters?,
        headers: [String : String],
        of type: T.Type
    ) async throws -> T
}

actor NetworkManager: NetworkService {
    func request<T: Decodable>(
        url: String,
        method: HTTPMethod,
        params: Parameters?,
        headers: [String : String],
        of type: T.Type
    ) async throws -> T{
        
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.prettyPrinted
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: method,
                parameters: params,
                encoding: encoding,
                headers: HTTPHeaders(headers)
            ).responseDecodable(of: type) { response in
                print("url \(url)")
                print("params \(params ?? [:])")
                switch response.result {
                case .success(let value):
                    print("response \(value)")
                    continuation.resume(returning: value)
                case .failure(let error):
                    print("error \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
