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
        selectedImageIndex = cellIndex
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let authorVC = storyBoard.instantiateViewController(withIdentifier: "authVC") as? AuthorViewController {
            authorVC.vm = viewModel.repoViewModels[cellIndex]
            if let cell = tableView.cellForRow(at: IndexPath(row: selectedImageIndex, section: 0)) as? ListCell, let img = cell.itemImage.image {
                authorVC.image = img
            }
            authorVC.transitioningDelegate = self
            self.present(authorVC, animated: true, completion: nil)
        }
    }
}
