//
//  OrderContentViewController.swift
//  NirSeller
//
//  Created by Nirvana on 9/9/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class OrderContentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var orderTableView: UITableView!
    
    var orderDataArray: [OrderModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("dataArray.count",orderDataArray.count)
        
        orderTableView.dataSource = self
        orderTableView.delegate = self
        
        orderTableView.rowHeight = UITableViewAutomaticDimension
        orderTableView.estimatedRowHeight = 80
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //如果取出的是FoodModel
        guard orderDataArray[indexPath.row] is InfoModel else {
            let cell = orderTableView.dequeueReusableCellWithIdentifier("foodCell") as! OrderFoodTableViewCell
            let cellData = orderDataArray[indexPath.row] as! FoodModel
            cell.symbolView.backgroundColor = cellData.symbolViewColor
            cell.foodName.text = cellData.foodName
            cell.foodNumber.text = cellData.foodNumber
            cell.foodPrice.text = cellData.foodPrice
            return cell
        }
        //取出的是InfoModel
        let cell = orderTableView.dequeueReusableCellWithIdentifier("infoCell") as! OrderInfoTableViewCell
        let cellData = orderDataArray[indexPath.row] as! InfoModel
        cell.orderNumber.text = cellData.orderNumber
        cell.orderTime.text = cellData.orderTime
        cell.phoneNumber.text = cellData.phoneNumber
        cell.delayTime.text = cellData.delayTime
        return cell
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
