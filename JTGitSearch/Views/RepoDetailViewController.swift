//
//  RepoDetailViewController.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 19/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import UIKit
import SafariServices

class RepoDetailViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userThumb: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var vm: RepoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = vm?.name
        userThumb.load(url: vm?.image, placeholder: UIImage(named: "noposter"))
        author.text = vm?.author
        forks.text = vm?.forks
        stars.text = vm?.stars
        language.text = vm?.language
        desc.text = vm?.description
    }
    
    @IBAction func openBrowser(_ sender: Any) {
        guard let urlStr = vm?.htmlUrl, let url = URL(string: urlStr) else { return }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
}
