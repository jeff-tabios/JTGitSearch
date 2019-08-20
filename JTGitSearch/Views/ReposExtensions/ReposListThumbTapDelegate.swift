//
//  ReposListThumbTapDelegate.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 19/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import Foundation

import UIKit

extension ReposViewController: ThumbTapDelegate {
    
    func thumbTapped(cellIndex: Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let authorVC = storyBoard.instantiateViewController(withIdentifier: "authVC") as! AuthorViewController
        authorVC.vm = viewModel.repoViewModels[cellIndex]
        self.present(authorVC, animated: true, completion: nil)
    }
}
