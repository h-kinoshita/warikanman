//
//  InputAmountViewController.swift
//  warikanman
//
//  Created by h.kinoshita on 2016/06/23.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

// framework
import UIKit

// mark: - InputAmountViewController
class InputAmountViewController: UIViewController, UITextFieldDelegate {

    
// mark: - public vars
    internal var amount: NSString = "";

    
// mark: - properties
    @IBOutlet weak var amountTextField: UITextField!

// mark: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.amountTextField.delegate = self

    }


// mark: - memory management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

// mark: - delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        self.amount = amountTextField.text!
        
        // キーボードを閉じる
        amountTextField.resignFirstResponder()
        
        return true
    }

// mark: - Actions
    @IBAction func okButtonTapped(sender: AnyObject) {
        let cameraViewController: CameraViewController = storyboard!.instantiateViewControllerWithIdentifier("CameraViewController") as! CameraViewController
        cameraViewController.amount = self.amount
        presentViewController(cameraViewController, animated: true, completion: nil)
    }
}
