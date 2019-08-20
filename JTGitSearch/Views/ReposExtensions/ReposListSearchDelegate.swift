//
//  ReposListSearchDelegate.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 18/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation
import UIKit

extension ReposViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        searchSettings.isHidden = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchDone()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchDone()
        if let query = searchBar.text {
            viewModel.reload(with: query,
                             sort: getSortSetting(),
                             order: getOrderSetting())
        }
    }
    
    func searchDone(){
        searchSettings.isHidden = true
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func getSortSetting() -> String{
        switch sortBy.selectedSegmentIndex {
        case 1: return "forks"
        case 2: return "stars"
        default:
            return ""
        }
    }
    
    func getOrderSetting() -> String{
        switch orderBy.selectedSegmentIndex {
        case 1: return "desc"
        case 2: return "asc"
        default:
            return ""
        }
    }
}
