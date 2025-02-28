//
//  EndPoint.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 16/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String:String]

protocol EndPoint{
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var params: Parameters { get }
}

