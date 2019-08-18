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
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchDone()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchDone()
        if let query = searchBar.text {
            viewModel.reload(with: query)
        }
    }
    
    func searchDone(){
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
}
