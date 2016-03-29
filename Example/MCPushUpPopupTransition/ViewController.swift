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
    
    var customPresentAnimationController: UIViewControllerAnimatedTransitioning = CustomPresentAnimationController(duration: 0.5, alphaValue: 0.5)
    var customDismissAnimationController: UIViewControllerAnimatedTransitioning = CustomDismissAnimationController(duration: 0.5, alphaValue: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlphaTransition(sender: UIButton) {
        self.customPresentAnimationController = CustomPresentAnimationController(duration: 0.5, alphaValue: 0.5)
        self.customDismissAnimationController = CustomDismissAnimationController(duration: 0.5, alphaValue: 0.5)
        self.performSegueWithIdentifier("ShowAction", sender: nil)
    }
    
    @IBAction func showBlurTransition(sender: UIButton) {
        self.customPresentAnimationController = BlurPresentAnimationController(duration: 0.5, alphaValue: 0.5)
        self.customDismissAnimationController = BlurDismissAnimationController(duration: 0.5, alphaValue: 0.5)
        self.performSegueWithIdentifier("ShowAction", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAction" {
            let toVC = segue.destinationViewController as UIViewController
            toVC.transitioningDelegate = self
            toVC.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        }
    }
    
    // MARK: - UIViewControllerTransitioning Delegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentAnimationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismissAnimationController
    }
    
}

