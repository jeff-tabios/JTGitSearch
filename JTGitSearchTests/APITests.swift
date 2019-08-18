//
//  APITests.swift
//  JTGitSearchTests
//
//  Created by Jeff Tabios on 16/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import XCTest
@testable import JTGitSearch

class APITests: XCTestCase {
    
    func test_API(){
        
        let sut = API(session: URLSessionMock())
        
        var repositories:Repositories?
        
        sut.request(endPoint: GitHubAPI.search(q: "tetris", page: 0, sort: "", order: "")) {(result:Result<Repositories,APIServiceError>) in
            switch result{
            case .success(let response):
                repositories = response
            case .failure:
                break
            }
        
        }
        
        XCTAssertEqual(repositories?.items.count, 1)
    }
    
}
