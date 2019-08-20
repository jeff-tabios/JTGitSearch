//
//  ReposViewModel.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 17/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

protocol AppendableList{
    var lastPageLoaded: Int {get set}
    var query: String {get set}
    var sort: String? {get set}
    var order: String? {get set}
    func reload(with term:String, sort: String?, order: String?)
    func getNextPage()
}

class ReposViewModel: AppendableList {
    var api:APIProtocol?
    var lastPageLoaded = 0
    var query = ""
    var sort: String?
    var order: String?
    var refreshRepoList:(()-> Void)?
    var repoViewModels:[RepoViewModel] = [] {
        didSet{
            self.refreshRepoList?()
        }
    }
    
    var failGetRepoList:(()-> Void)?
    var startGetRepoList:(()-> Void)?
    
    init(api:APIProtocol){
        self.api = api
    }
    
    func reload(with term:String = "", sort: String? = nil, order: String? = nil){
        lastPageLoaded = 0
        query = term
        self.sort = sort
        self.order = order
        repoViewModels = []
        getNextPage()
    }
    
    func getNextPage(){
        if !query.isEmpty{
            startGetRepoList?()
            api?.request(endPoint: GitHubAPI.search(q: query, page: lastPageLoaded+1, sort: sort, order: order),
                         completion: { [weak self] (result:Result<Repositories,APIServiceError>) in
                            switch result{
                            case .success(let repos):
                                self?.lastPageLoaded += 1
                                self?.repoViewModels += repos.items.map{RepoViewModel(repo: $0)}
                            case .failure:
                                self?.failGetRepoList?()
                            }
            })
        }
    }
}
