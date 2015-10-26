//
//  BasePageViewController.swift
//  ScrollViewChalenge
//
//  Created by Roman Shcherbii on 10/26/15.
//  Copyright © 2015 Roman Shcherbii. All rights reserved.
//

import UIKit

class BasePageViewController: UIPageViewController {
    
    var  pageCount = 5;
    var currentPage = 0;
    
    var contentControllers: [UIViewController] = []
    
    func setupContentControllers() {
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupContentControllers()
        
        //self.dataSource = self
        self.setViewControllers([self.contentControllers[0]], direction: .Forward, animated: true, completion: nil)
    }

    
    func moveForward() {
        
        if self.currentPage >= self.contentControllers.count - 1 {
            return
        }
        
        self.setViewControllers([self.contentControllers[self.currentPage + 1]], direction: .Forward, animated: true, completion: nil)
        self.currentPage = self.currentPage + 1
        
    }
    
    func moveBack() {
        
        if self.currentPage <= 0 {
            return
        }
        self.setViewControllers([self.contentControllers[self.currentPage - 1]], direction: .Reverse, animated: true, completion: nil)
        self.currentPage = self.currentPage - 1
        
    }

    

}

// MARK: - UIPageViewControllerDataSource

extension BasePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController
        let index = (self.contentControllers.indexOf(vc))!
        
        if index <= 0 {
            return nil
        }
        
        self.currentPage = index - 1
        return self.contentControllers[index - 1]
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController
        let index = (self.contentControllers.indexOf(vc))!
        
        if index >= self.contentControllers.count - 1 {
            return nil
        }
        
        self.currentPage = index + 1
        return self.contentControllers[index + 1]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.contentControllers.count
    }
    
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

