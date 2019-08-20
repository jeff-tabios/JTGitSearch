//
//  ListCell.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 18/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: ThumbImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var language: UILabel!
    
    var vm: RepoViewModel?{
        didSet{
            itemImage.load(url: vm?.image, placeholder: UIImage(named: "noposter"))
            name.text = vm?.name
            author.text = vm?.author
            forks.text = vm?.forks
            language.text = vm?.language
        }
    }
}
