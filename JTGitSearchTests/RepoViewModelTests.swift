//
//  RepoViewModelTests.swift
//  JTGitSearchTests
//
//  Created by Jeff Tabios on 17/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import XCTest
@testable import JTGitSearch

class RepoViewModelTests: XCTestCase {
    
    var sut: RepoViewModel?
    var repositories:Repositories?
    
    override func setUp() {
        super.setUp()

        let api = API(session: URLSessionMock())
        
        api.request(endPoint: GitHubAPI.search(q: "tetris", page: 0, sort: "", order: "")) { [weak self] (result:Result<Repositories,APIServiceError>) in
            switch result{
            case .success(let response):
                self?.repositories = response
                if let repo = self?.repositories?.items[0] {
                    self?.sut = RepoViewModel(repo:repo)
                }
            case .failure:
                break
            }
        }
    }
    
    func test_image(){
        XCTAssertEqual(URL(string: (repositories?.items[0].owner.avatarURL)!), sut?.image)
    }
    
    func test_name(){
        XCTAssertEqual(repositories?.items[0].name, sut?.name)
    }
    
    func test_description(){
        XCTAssertEqual(repositories?.items[0].itemDescription, sut?.description)
    }
    
    func test_htmlUrl(){
        XCTAssertEqual(repositories?.items[0].htmlURL, sut?.htmlUrl)
    }
    
    func test_author(){
        XCTAssertEqual("By: \((repositories?.items[0].owner.login)!)", sut?.author)
    }
    
    func test_forks(){
        XCTAssertEqual("Forks: \((repositories?.items[0].forks)!)", sut?.forks)
    }
    
    func test_stars(){
        XCTAssertEqual("Stars: \((repositories?.items[0].stargazersCount)!)", sut?.stars)
    }
    
    func test_language(){
        XCTAssertEqual("Language: \((repositories?.items[0].language)!)", sut?.language)
    }
}
