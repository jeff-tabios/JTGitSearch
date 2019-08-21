//
//  AuthorViewController.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 19/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import UIKit
import SafariServices

class AuthorViewController: UIViewController {

    @IBOutlet weak var aImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var vm: RepoViewModel?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        aImage.load(url: vm?.image, placeholder: UIImage(named: "noposter"))
        aImage.image = image
        name.text = vm?.author
        aImage.layer.cornerRadius = aImage.frame.size.width / 2
    }
    
    @IBAction func openUrl(_ sender: Any) {
        guard let urlStr = vm?.authorUrl, let url = URL(string: urlStr) else { return }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
