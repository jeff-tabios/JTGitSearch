//
//  ReposViewModelTests.swift
//  JTGitSearchTests
//
//  Created by Jeff Tabios on 18/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import XCTest
@testable import JTGitSearch

class ReposViewModelTests: XCTestCase {

    var sut: ReposViewModel?
    var repositories:Repositories?
    
    override func setUp() {
        super.setUp()
        
        sut = ReposViewModel(api: API(session: URLSessionMock()))
        
    }
    
    func test_getNextPage() {
        sut?.reload(with: "test")
        
        XCTAssertEqual(sut?.repoViewModels.count, 1)
    }

}
