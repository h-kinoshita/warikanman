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

// mark: - properties
    @IBOutlet weak var amountTextField: UITextField!
    

// mark: - public vars
    var amount: NSString = "";

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
    }
}
