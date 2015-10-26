//
//  SecondPageViewController.swift
//  ScrollViewChalenge
//
//  Created by Roman Shcherbii on 10/26/15.
//  Copyright © 2015 Roman Shcherbii. All rights reserved.
//

import UIKit

class SecondPageViewController: BasePageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.postHeightNotificationForTableController(self.contentControllers[0] as! TableViewController)

    }
    
    static let HeightNotification = "HeightNotification"
    
    override func setupContentControllers() {
        
        var controllersArray = [UIViewController]()
        
        for _ in 0..<self.pageCount {
            let contentController = TableViewController()
            
            controllersArray += [contentController]
            
        }
        self.contentControllers = controllersArray
    }
    
    override func moveForward() {
        
        super.moveForward()
        
        self.postHeightNotificationForTableController(self.contentControllers[self.currentPage] as! TableViewController)
    }
    
    override func moveBack() {
        super.moveBack()
        
        self.postHeightNotificationForTableController(self.contentControllers[self.currentPage] as! TableViewController)
    }

    func postHeightNotificationForTableController(tableController: TableViewController) {
        
        let height: CGFloat = CGFloat(tableController.cellHeight * tableController.cellCount)
        
        NSNotificationCenter.defaultCenter().postNotificationName(SecondPageViewController.HeightNotification, object: nil, userInfo: ["height" : height])
    }

}

    
