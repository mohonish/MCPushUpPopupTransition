//
//  BlurPresentAnimationController.swift
//  Pods
//
//  Created by Mohonish Chakraborty on 29/03/16.
//
//

import Foundation
import UIKit

public class BlurPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: NSTimeInterval!
    let alphaValue: CGFloat!
    
    public init(duration: NSTimeInterval, alphaValue: CGFloat) {
        self.duration = duration
        self.alphaValue = alphaValue
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning Protocol
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController!)
        let containerView = transitionContext.containerView()
        
        let bounds = UIScreen.mainScreen().bounds
        toViewController!.view.frame = CGRectOffset(finalFrameForVC, 0, bounds.size.height)
        
        // Blur Effect
        let blurEffect = UIBlurEffect(style: .Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = fromViewController!.view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        blurEffectView.tag = 151
        blurEffectView.alpha = 0
        fromViewController!.view.addSubview(blurEffectView)
        
        containerView?.addSubview((toViewController?.view)!)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            blurEffectView.alpha = self.alphaValue
            toViewController!.view.frame = finalFrameForVC
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
        })
        
    }
    
}
