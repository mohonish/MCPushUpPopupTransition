//
//  ViewController.swift
//  MCPushUpPopupTransition
//
//  Created by Mohonish Chakraborty on 03/15/2016.
//  Copyright (c) 2016 Mohonish Chakraborty. All rights reserved.
//

import UIKit
import MCPushUpPopupTransition

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let customPresentAnimationController = CustomPresentAnimationController()
    let customDismissAnimationController = CustomDismissAnimationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAction" {
            let toVC = segue.destinationViewController as UIViewController
            toVC.transitioningDelegate = self
            toVC.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        }
    }
    g
    // MARK: - UIViewControllerTransitioning Delegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentAnimationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismissAnimationController
    }
    
}

