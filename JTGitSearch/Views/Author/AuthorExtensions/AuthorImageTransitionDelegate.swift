//
//  AuthorImageTransitionDelegate.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 21/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import UIKit

extension AuthorViewController: ImageTransitionProtocol {
    
    func imageWindowFrame() -> CGRect{
        return aImage.frame
    }
}
