//
//  AnimatorController.swift
//  JTGitSearch
//
//  Created by Jeff Tabios on 20/08/2019.
//  Copyright © 2019 Jeff Tabios. All rights reserved.
//

import UIKit

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var image: UIImage?
    private var fromDelegate: ImageTransitionProtocol?
    private var toDelegate: ImageTransitionProtocol?
    
    func setupImageTransition(image: UIImage, fromDelegate: ImageTransitionProtocol, toDelegate: ImageTransitionProtocol){
        self.image = image
        self.fromDelegate = fromDelegate
        self.toDelegate = toDelegate
    }
    
    // 1: Set animation speed
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // 2: Get view controllers involved
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        // 3: Set the destination view controllers frame
        toVC.view.frame = fromVC.view.frame
        
        // 4: Create transition image view
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = (fromDelegate == nil) ? CGRect(x: 0, y: 0, width: 0, height: 0) : fromDelegate!.imageWindowFrame()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        containerView.addSubview(imageView)
        
        // 5: Create from screen snapshot
        
        let fromSnapshot = fromVC.view.snapshotView(afterScreenUpdates: true)
        fromSnapshot?.frame = fromVC.view.frame
        containerView.addSubview(fromSnapshot!)
        
        // 6: Create to screen snapshot
        let toSnapshot = toVC.view.snapshotView(afterScreenUpdates: true)
        toSnapshot?.frame = fromVC.view.frame
        containerView.addSubview(toSnapshot!)
        toSnapshot?.alpha = 0
        
        // 7: Bring the image view to the front and get the final frame
        containerView.bringSubviewToFront(imageView)
        let toFrame = (self.toDelegate == nil) ? CGRect(x: 0, y: 0, width: 0, height: 0) : self.toDelegate!.imageWindowFrame()
        
        // 8: Animate change
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            toSnapshot?.alpha = 1
            imageView.frame = toFrame
            imageView.layer.cornerRadius = imageView.frame.size.width / 2
            
        }) {(finished) in
            
            // 9: Remove transition views
            imageView.removeFromSuperview()
            fromSnapshot?.removeFromSuperview()
            toSnapshot?.removeFromSuperview()
            
            // 10: Complete transition
            if !transitionContext.transitionWasCancelled {
                containerView.addSubview(toVC.view)
            }
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

protocol ImageTransitionProtocol {
    func imageWindowFrame() -> CGRect
}
