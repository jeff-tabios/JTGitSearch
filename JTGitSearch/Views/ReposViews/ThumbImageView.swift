//
//  ThumbImageView.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 19/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import UIKit

protocol ThumbTapDelegate: class {
    func thumbTapped(cellIndex: Int)
}

class ThumbImageView: UIImageView {
    
    var cellIndex: Int!
    weak var delegate: ThumbTapDelegate?
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tapGestureRecognizer.addTarget(self, action: #selector(imageTapped(recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        delegate?.thumbTapped(cellIndex: cellIndex)
    }
}
