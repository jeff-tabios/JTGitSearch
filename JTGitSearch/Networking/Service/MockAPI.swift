//
//  MockAPI.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 16/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

class MockAPI:API{
    var jsonFile = "MockResults"
    override func request<U>(endPoint: EndPoint, completion: @escaping (Result<U, APIServiceError>) -> Void) where U : Decodable, U : Encodable {
        
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                decode(completion: completion)
            } catch {
                completion(.failure(.noData))
            }
        }else{
            completion(.failure(.fileNotFound))
        }
    }
}
