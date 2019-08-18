//
//  GitHubAPI.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 16/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

enum GitHubAPI {
    case search(q:String,page:Int?,sort:String?,order:String?)
}

extension GitHubAPI: EndPoint {
    var apiKey: String { return "4nXMkAqbt5gKaHvB1nO8TCTo54r26AAA" }
    
    var baseURL: String {
        return "https://api.github.com/search/repositories"
    }
    
    var path: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
    
    var params: Parameters {
        var items = Parameters()
        
        switch self {
        case .search(let q,let page,let sort, let order):
            
            items["q"]=q
            
            if let page = page, page > 0{
                items["page"]="\(page)"
            }
            
            if let sort = sort, !sort.isEmpty {
                items["sort"]=sort
                
                if let order = order, !order.isEmpty {
                    items["order"]=order
                }
            }
        }
        
        return items
    }
}

