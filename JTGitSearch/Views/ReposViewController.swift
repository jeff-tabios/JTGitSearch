//
//  ReposViewController.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 18/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import UIKit

class ReposViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchBar = UISearchBar()
    var viewModel = ReposViewModel(api: API())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
//        viewModel.getNextPage()
        viewModel.refreshRepoList = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
