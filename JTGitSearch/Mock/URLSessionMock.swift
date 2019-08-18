//
//  URLSessionMock.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 18/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    // Properties that enable us to set exactly what data or error
    // we want our mocked URLSession to return for any request.
    var data: Data?
    var error: Error?
    var response: HTTPURLResponse?
    
    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
        ) -> URLSessionDataTask {
        
        let jsonFile = "MockResults"
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                response = HTTPURLResponse(url: fileUrl, statusCode: 200, httpVersion: "", headerFields: nil)
            } catch {
                self.error = APIServiceError.noData
            }
        }else{
            error = APIServiceError.fileNotFound
        }
        
        let data = self.data
        let error = self.error
        let response = self.response
        
        return URLSessionDataTaskMock {
            completionHandler(data, response, error)
        }
    }
}
