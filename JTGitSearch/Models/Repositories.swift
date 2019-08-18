//
//  Repositories.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 17/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

// MARK: - Repositories
struct Repositories: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

public struct Repository: Codable {
    let name: String
    let owner: Owner
    let htmlURL: String
    let itemDescription: String
    let forks, stargazersCount: Int
    let language: String?
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case htmlURL = "html_url"
        case itemDescription = "description"
        case stargazersCount = "stargazers_count"
        case language
        case forks
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
