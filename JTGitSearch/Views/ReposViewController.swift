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
    @IBOutlet weak var sortButton: UIButton!
    let searchBar = UISearchBar()
    //    var viewModel = ReposViewModel(api: API())
    var viewModel = ReposViewModel(api: API(session: URLSessionMock()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        viewModel.reload(with: "dragons")
        viewModel.refreshRepoList = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        sortButton.layer.cornerRadius = 22
    }
    
    @IBAction func sort(_ sender: Any) {
        
    }
    
    //MARK: SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSeque" {
            let s = sender as! ListCell
            let detailVC = segue.destination as! RepoDetailViewController
            detailVC.vm = s.vm
            
        }
    }
}
