//
//  MenuAddViewController.swift
//  NirSeller
//
//  Created by Nirvana on 9/13/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

protocol MenuAddViewDelegate {
    func insertNewData(newData: MenuModel)
}

class MenuAddViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var newMenuImage: UIButton!
    @IBOutlet weak var newMenuName: UITextField!
    @IBOutlet weak var newMenuDescribe: UITextView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var newMenuPrice: UITextField!
    
    var delegate: MenuAddViewDelegate?
    
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
    
    @IBAction func choosePhoto(sender: UIButton) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            self.goCamera()
        }
        let archiveAction = UIAlertAction(title: "从相册选择", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
            self.goImage()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func goCamera() {
        
        var sourceType = UIImagePickerControllerSourceType.Camera
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = sourceType
        
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func goImage() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        picker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(picker.sourceType)!
        
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        newMenuImage.setImage(image, forState: UIControlState.Normal)
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    

    @IBAction func doneButtonClicked(sender: UIBarButtonItem) {
        let textData = MenuModel(menuImage: newMenuImage.imageView!.image!, menuName: newMenuName.text!, menuPrice: "￥"+newMenuPrice.text!, menuDescribe: newMenuDescribe.text)
        delegate?.insertNewData(textData)
        dismissViewControllerAnimated(true, completion: nil)
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
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let textData = MenuModel(menuImage: UIImage(named: "jipai")!, menuName: newMenuName.text!, menuPrice: "￥20", menuDescribe: newMenuDescribe.text)
//        
//        if let destination = segue.destinationViewController as? MenuTableViewController {
//            
//            destination.tempMenuModel = textData
//        }
//    }

}
