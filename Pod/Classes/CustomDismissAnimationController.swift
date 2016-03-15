//
//  CustomDIsmissAnimationController.swift
//  TransitionExample
//
//  Created by Mohonish Chakraborty on 15/03/16.
//  Copyright © 2016 codebrahma. All rights reserved.
//

import Foundation
import UIKit

public class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController!)
        
        toViewController!.view.frame = finalFrameForVC
        toViewController!.view.alpha = 0.5
        
        let bounds = UIScreen.mainScreen().bounds
        let fromFinalFrame = CGRectOffset(fromViewController!.view.frame, 0, bounds.size.height)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toViewController!.view.alpha = 1.0
            fromViewController!.view.frame = fromFinalFrame
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
        })
        
    }
    
}