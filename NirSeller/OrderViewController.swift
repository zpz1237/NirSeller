//
//  OrderViewController.swift
//  NirSeller
//
//  Created by Nirvana on 9/9/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.translucent = false
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        var controllerArray: [UIViewController] = []
        
        let newOrderViewController = storyBoard.instantiateViewControllerWithIdentifier("OrderContentViewID") as! OrderContentViewController
        let oldOrderViewController = storyBoard.instantiateViewControllerWithIdentifier("OrderContentViewID") as! OrderContentViewController
        
        controllerArray.append(newOrderViewController)
        controllerArray.append(oldOrderViewController)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
