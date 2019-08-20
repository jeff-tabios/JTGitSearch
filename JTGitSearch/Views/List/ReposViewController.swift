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
    @IBOutlet weak var searchSettings: UIView!
    @IBOutlet weak var sortBy: UISegmentedControl!
    @IBOutlet weak var orderBy: UISegmentedControl!
    
    var viewModel = ReposViewModel(api: API())
    let searchBar = UISearchBar()
    let spinner = UIActivityIndicatorView(style: .gray)
    var animationController = AnimationController()
    var hideSelectedCell: Bool = false
    var selectedImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        viewModel.reload(with: "tetris")
        
        //Closure calls
        viewModel.startGetRepoList = { [weak self] () in
            self?.tableView.tableFooterView?.isHidden = false
        }
        viewModel.refreshRepoList = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.tableView.tableFooterView?.isHidden = true
            }
        }
        viewModel.failGetRepoList = { [weak self] () in
            self?.showWarning()
            self?.tableView.tableFooterView?.isHidden = true
        }
        
        //Search bar
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        searchSettings.isHidden = true
        
        //Spinner
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        tableView.tableFooterView = spinner
        tableView.tableFooterView?.isHidden = true
    }
    
    func showWarning(){
        let dialogMessage = UIAlertController(title: "Connection Problem", message: "Cannot connect to server. Please check your connection and refresh.", preferredStyle: .alert)
        let refresh = UIAlertAction(title: "Refresh", style: .default, handler: { [weak self] (action) -> Void in
            self?.viewModel.getNextPage()
        })
        dialogMessage.addAction(refresh)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSeque" {
            if let s = sender as? ListCell{
                if let detailVC = segue.destination as? RepoDetailViewController {
                    detailVC.vm = s.vm
                }
            }
        }
    }
}
