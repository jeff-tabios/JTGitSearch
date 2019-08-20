//
//  ReposListTransitionDelegate.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 20/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//
import UIKit

// 1: Conforming to protocol
extension ReposViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            if let cell = tableView.cellForRow(at: IndexPath(row: selectedImageIndex, section: 0)) as? ListCell{
                let authorViewController = presented as! AuthorViewController
                animationController.setupImageTransition( image: cell.itemImage.image!,
                                                          fromDelegate: self,
                                                          toDelegate: authorViewController)
            }
            
            return animationController
    }
    
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            if let cell = tableView.cellForRow(at: IndexPath(row: selectedImageIndex, section: 0)) as? ListCell{
                let authorViewController = dismissed as! AuthorViewController
                animationController.setupImageTransition( image: cell.itemImage.image!,
                                                          fromDelegate: authorViewController,
                                                          toDelegate: self)
            }
            return animationController
    }

}
