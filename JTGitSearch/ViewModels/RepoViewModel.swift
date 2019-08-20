//
//  RepoViewModel.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 17/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

public protocol RepoDetail{
    var repo: Repository {get set}
    var image: URL? { get }
    var name: String? {get }
    var description: String? {get }
    var htmlUrl: String? {get }
    var author: String? {get }
    var authorUrl: String? {get }
    var forks: String? {get }
    var stars: String? {get }
    var language: String? {get }
}

public extension RepoDetail{
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
        return "Author: " + repo.owner.login
    }
    var authorUrl: String? {
        return repo.owner.htmlURL
    }
    var forks: String? {
        return "Forks: \(repo.forks)"
    }
    var stars: String? {
        return "Stars: \(repo.stargazersCount)"
    }
    var language: String? {
        if let lang = repo.language{
            return "Language: " + lang
        }
        return ""
    }
}

struct RepoViewModel: RepoDetail {
    var repo: Repository
    
    public init(repo: Repository){
        self.repo = repo
    }
}
