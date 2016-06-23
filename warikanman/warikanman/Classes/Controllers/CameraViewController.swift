//
//  CameraViewController.swift
//  warikanman
//
//  Created by h.kinoshita on 2016/06/24.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

// framework
import UIKit

// mark: - CameraViewController
class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var cameraImage:UIImage!
// mark: - lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.cameraImage = image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.dismissViewControllerAnimated(true) {}
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true) {}
    }

    @IBAction func onTap(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        picker.delegate = self
        
        presentViewController(picker, animated: true, completion: nil)
    }
    @IBAction func tapNextButton(sender: AnyObject) {
        let checkViewController: CheckImageViewController = storyboard!.instantiateViewControllerWithIdentifier("CheckImageViewController") as! CheckImageViewController
        checkViewController.image = self.cameraImage
        presentViewController(checkViewController, animated: true, completion: nil)
    }

}
