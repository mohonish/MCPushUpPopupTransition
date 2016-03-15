//
//  CustomPresentAnimationController.swift
//  TransitionExample
//
//  Created by Mohonish Chakraborty on 15/03/16.
//  Copyright © 2016 codebrahma. All rights reserved.
//

import Foundation
import UIKit

class CustomPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - UIViewControllerAnimatedTransitioning Protocol
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController!)
        let containerView = transitionContext.containerView()
        
        let bounds = UIScreen.mainScreen().bounds
        toViewController!.view.frame = CGRectOffset(finalFrameForVC, 0, bounds.size.height)
        
        containerView?.addSubview((toViewController?.view)!)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            fromViewController!.view.alpha = 0.5
            toViewController!.view.frame = finalFrameForVC
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
        })
        
    }
    
}