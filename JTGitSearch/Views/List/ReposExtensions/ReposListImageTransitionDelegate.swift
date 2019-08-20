//
//  ReposListImageTransitionProtocol.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 21/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//


import UIKit

extension ReposViewController: ImageTransitionProtocol {
    
    func imageWindowFrame() -> CGRect{
        if let cell = tableView.cellForRow(at: IndexPath(row: selectedImageIndex, section: 0)) as? ListCell{
            return cell.convert(cell.itemImage.frame, to: self.view)
        }
        return CGRect()
    }
}
