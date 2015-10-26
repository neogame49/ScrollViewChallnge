//
//  ViewController.swift
//  ScrollViewChalenge
//
//  Created by Roman Shcherbii on 10/26/15.
//  Copyright © 2015 Roman Shcherbii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondPageHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        NSNotificationCenter.defaultCenter().addObserverForName(SecondPageViewController.HeightNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            self.secondPageHeightConstraint.constant = notification.userInfo!["height"] as! CGFloat
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for vc in self.childViewControllers {
            print(vc.restorationIdentifier)
        }
    }
    
    var firstPage: FirstPageViewController! {
        for vc in self.childViewControllers {
            if vc.restorationIdentifier! == "FirstPageViewController" {
                return vc as! FirstPageViewController
            }
            
        }
        
        return nil
    }
    
    var secondPage: SecondPageViewController! {
        for vc in self.childViewControllers {
            if vc.restorationIdentifier! == "SecondPageViewController" {
                return vc as! SecondPageViewController
            }
            
        }
        
        return nil
    }

    @IBAction func backAction(sender: AnyObject) {
        
        self.firstPage.moveBack()
        self.secondPage.moveBack()
        
        //self.secondPageHeightConstraint.constant -= 50

    }

    @IBAction func forwardAction(sender: AnyObject) {
        self.firstPage.moveForward()
        self.secondPage.moveForward()
        
        //self.secondPageHeightConstraint.constant += 50
    }
}

