//
//  MenuTableViewController.swift
//  NirSeller
//
//  Created by Nirvana on 9/10/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuTableView: UITableView!
    
    var menuDataArray: [MenuModel] = []
    var tempMenuModel: MenuModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self

        let testDataA = MenuModel(menuImage: UIImage(named: "jipai")!, menuName: "劲脆鸡排饭", menuPrice:
        "￥13", menuDescribe: "看起来就相当的好吃")
        let testDataB = MenuModel(menuImage: UIImage(named: "jipai")!, menuName: "还是劲脆鸡排饭", menuPrice:
            "￥15", menuDescribe: "看起来也相当的好吃")
        let testDataC = MenuModel(menuImage: UIImage(named: "jipai")!, menuName: "仍然是是劲脆鸡排饭", menuPrice:
            "￥30", menuDescribe: "为什么贵了这么多")
        
        menuDataArray.append(testDataA)
        menuDataArray.append(testDataB)
        menuDataArray.append(testDataC)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        if let new = tempMenuModel {
            menuDataArray.append(new)
            menuTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuDataArray.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCellWithIdentifier("menuItem", forIndexPath: indexPath) as! MenuTableViewCell

        cell.menuImageView.image = menuDataArray[indexPath.row].menuImage
        cell.menuName.text = menuDataArray[indexPath.row].menuName
        cell.menuPrice.text = menuDataArray[indexPath.row].menuPrice
        cell.menuDescribe.text = menuDataArray[indexPath.row].menuDescribe

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            menuDataArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    @IBAction  func unwindToMenuTableView(unwindSegue: UIStoryboardSegue) {
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
