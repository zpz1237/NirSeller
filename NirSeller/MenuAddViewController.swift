//
//  MenuAddViewController.swift
//  NirSeller
//
//  Created by Nirvana on 9/13/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class MenuAddViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var newMenuImage: UIButton!
    @IBOutlet weak var newMenuName: UITextField!
    @IBOutlet weak var newMenuDescribe: UITextView!
    @IBOutlet weak var backLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //newMenuImage.imageView!.contentMode = UIViewContentMode.ScaleAspectFill
        newMenuDescribe.layer.cornerRadius = 5
        newMenuDescribe.layer.borderWidth  = 0.5
        newMenuDescribe.layer.borderColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1).CGColor
        newMenuDescribe.delegate = self
        
        backLabel.textColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text != "" {
            backLabel.hidden = true
        }
        if text == "" && (textView.text as NSString).length == 1 {
            backLabel.hidden = false
        }
        if text == "\n" {
            textView.resignFirstResponder()
            return false;
        }
        return true;
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let textData = MenuModel(menuImage: UIImage(named: "jipai")!, menuName: newMenuName.text!, menuPrice: "￥20", menuDescribe: newMenuDescribe.text)
        
        if let destination = segue.destinationViewController as? MenuTableViewController {
            
            destination.tempMenuModel = textData
        }
    }

}
