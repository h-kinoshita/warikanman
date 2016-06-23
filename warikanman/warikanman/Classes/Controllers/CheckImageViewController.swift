//
//  CheckImageViewController.swift
//  warikanman
//
//  Created by h.kinoshita on 2016/06/24.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

import UIKit
import CoreImage

class CheckImageViewController: UIViewController {

    internal var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
