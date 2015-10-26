//
//  FirstPageViewController.swift
//  ScrollViewChalenge
//
//  Created by Roman Shcherbii on 10/26/15.
//  Copyright © 2015 Roman Shcherbii. All rights reserved.
//

import UIKit

class FirstPageViewController: BasePageViewController {
  

    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    
    override func setupContentControllers() {
        
        var controllersArray = [UIViewController]()
        
        for _ in 0..<self.pageCount {
            let contentController = UIViewController()
            contentController.view.backgroundColor = self.getRandomColor()
            
            controllersArray += [contentController]
            
        }
        self.contentControllers = controllersArray
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   }

extension FirstPageViewController: UIPageViewControllerDelegate {
}


