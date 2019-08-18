//
//  API.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 16/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

public enum APIServiceError: Error {
    case none
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
    case fileNotFound
}

protocol APIProtocol{
    func request<U:Codable>(endPoint: EndPoint, completion: @escaping (Result<U,APIServiceError>)->Void)
    func decode<U:Decodable>(completion: @escaping (Result<U,APIServiceError>)->Void)
}

class API:APIProtocol{
    
    var session:URLSession // = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var data: Data?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<U:Codable>(endPoint: EndPoint, completion: @escaping (Result<U,APIServiceError>)->Void){
        
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: endPoint.baseURL) {
            urlComponents.query = endPoint.params.map{$0.key + "=" + $0.value}.joined(separator: "&")
            
            guard let url = urlComponents.url else {
                return
            }
            
            dataTask =
                session.dataTask(with: url) { [weak self] data, response, error in
                    defer {
                        self?.dataTask = nil
                    }
                    
                    if error != nil {
                        completion(.failure(.apiError))
                    } else if
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200
                    {
                        self?.data = data
                        self?.decode(completion: completion)
                    }else{
                        completion(.failure(.invalidResponse))
                    }
            }
            dataTask?.resume()
        }
    }
    
    func decode<U:Decodable>(completion: @escaping (Result<U,APIServiceError>)->Void){
        if let data = data {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            guard let result = try? decoder.decode(U.self, from: data) else{
                completion(.failure(.decodeError))
                return
            }
            completion(.success(result))
        }else{
            completion(.failure(.decodeError))
        }
    }
}
