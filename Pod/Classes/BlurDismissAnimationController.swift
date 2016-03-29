//
//  BlurDismissAnimationController.swift
//  Pods
//
//  Created by Mohonish Chakraborty on 29/03/16.
//
//

import Foundation
import UIKit

public class BlurDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: NSTimeInterval!
    let alphaValue: CGFloat!
    
    public init(duration: NSTimeInterval, alphaValue: CGFloat) {
        self.duration = duration
        self.alphaValue = alphaValue
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController!)
        
        toViewController!.view.frame = finalFrameForVC
        
        let bounds = UIScreen.mainScreen().bounds
        let fromFinalFrame = CGRectOffset(fromViewController!.view.frame, 0, bounds.size.height)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toViewController!.view.viewWithTag(151)!.alpha = 0
            fromViewController!.view.frame = fromFinalFrame
            }, completion: { (finished) in
                toViewController!.view.viewWithTag(151)?.removeFromSuperview()
                transitionContext.completeTransition(true)
        })
        
    }
    
}