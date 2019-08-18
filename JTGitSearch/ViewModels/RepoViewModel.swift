//
//  RepoViewModel.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 17/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

protocol RepoDetail{
    var repo: Repository {get set}
    var image: URL? { get }
    var name: String? {get }
    var description: String? {get }
    var htmlUrl: String? {get }
    var author: String? {get }
    var forks: Int? {get }
    var stars: Int? {get }
    var language: String? {get }
}

extension RepoDetail{
    var image: URL? {
        return URL(string: repo.owner.avatarURL)
    }
    var name: String? {
        return repo.name
    }
    var description: String? {
        return repo.itemDescription
    }
    var htmlUrl: String? {
        return repo.htmlURL
    }
    var author: String? {
        return repo.owner.login
    }
    var forks: Int? {
        return repo.forks
    }
    var stars: Int? {
        return repo.stargazersCount
    }
    var language: String? {
        return repo.language
    }
}

struct RepoViewModel: RepoDetail {
    var repo: Repository
    
    public init(repo: Repository){
        self.repo = repo
    }
}
