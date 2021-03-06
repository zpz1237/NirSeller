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
    var newOrderViewController: OrderContentViewController!
    var oldOrderViewController: OrderContentViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationController?.navigationBar.translucent = false
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        var controllerArray: [UIViewController] = []
        
        let testDataA = FoodModel(symbolViewColor: UIColor.lightGrayColor(), foodName: "经典奥尔良鸡排米饭小套餐", foodNumber: "1", foodPrice: "￥12")
        let testDataB = FoodModel(symbolViewColor: UIColor.lightGrayColor(), foodName: "琵琶鸡腿饭", foodNumber: "1", foodPrice: "￥15")
        let testDataC = InfoModel(orderNumber: "2015090917432800", orderTime: "2015-09-09 17:43:28", phoneNumber: "18463103027", delayTime: "30分钟后")
        let testDataD = FoodModel(symbolViewColor: UIColor.lightGrayColor(), foodName: "宝岛招牌饭", foodNumber: "1", foodPrice: "￥13")
        let testDataE = InfoModel(orderNumber: "2015091011234900", orderTime: "2015-09-10 11:23:49", phoneNumber: "18953831358", delayTime: "45分钟后")
        
        newOrderViewController = storyBoard.instantiateViewControllerWithIdentifier("OrderContentViewID") as! OrderContentViewController
        oldOrderViewController = storyBoard.instantiateViewControllerWithIdentifier("OrderContentViewID") as! OrderContentViewController
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchToSecondPageFunction", name: "switchToSecondPage", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchToFirstPageFunction", name: "switchToFirstPage", object: nil)
        
        newOrderViewController.orderDataArray.append(testDataA)
        newOrderViewController.orderDataArray.append(testDataB)
        newOrderViewController.orderDataArray.append(testDataC)
        
        oldOrderViewController.orderDataArray.append(testDataD)
        oldOrderViewController.orderDataArray.append(testDataE)
        
        newOrderViewController.title = "新订单"
        oldOrderViewController.title = "已处理"
        
        controllerArray.append(newOrderViewController)
        controllerArray.append(oldOrderViewController)
        
        //pageMenu的UI配置参数
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(4.3),
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .SelectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .MenuMargin(20.0),
            .MenuHeight(40.0),
            .SelectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .UnselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorRoundEdges(true),
            .SelectionIndicatorHeight(2.0),
            .MenuItemSeparatorPercentageHeight(0.1)
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 64.0, self.view.frame.width, self.view.frame.height - 64), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
        
    }
    
    func switchToSecondPageFunction() {
        self.navigationItem.rightBarButtonItem?.title = ""
    }
    
    func switchToFirstPageFunction() {
        self.navigationItem.rightBarButtonItem?.title = "下一单"
    }

    @IBAction func didClickedNextButton(sender: UIBarButtonItem) {
        
        let num = 3
        
        for i in 1...num {
            oldOrderViewController.orderDataArray.insert(newOrderViewController.orderDataArray[num-i], atIndex: 0)
        }
        for _ in 1...num {
            newOrderViewController.orderDataArray.removeFirst()
        }
        
//        print(newOrderViewController.orderDataArray)
        newOrderViewController.orderTableView.beginUpdates()
        newOrderViewController.orderTableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0), NSIndexPath(forRow: 1, inSection: 0), NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
        newOrderViewController.orderTableView.endUpdates()
        
//        oldOrderViewController.orderTableView.beginUpdates()
//        oldOrderViewController.orderTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0), NSIndexPath(forRow: 1, inSection: 0), NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Top)
//        oldOrderViewController.orderTableView.endUpdates()
        
        
        
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
