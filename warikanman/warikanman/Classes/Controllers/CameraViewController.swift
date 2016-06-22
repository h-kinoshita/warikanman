//
//  CameraViewController.swift
//  warikanman
//
//  Created by h.kinoshita on 2016/06/23.
//  Copyright © 2016年 mebro Inc. All rights reserved.
//

// framework
import UIKit
import AVFoundation

// mark: - CameraViewController
class CameraViewController: UIViewController {
    
    
// mark: - internal vars
    internal var amount: NSString = ""
    internal var imageView: UIImageView = UIImageView();

// mark: - private vars
    private var mySession: AVCaptureSession!
    private var myDevice: AVCaptureDevice!
    private var myImageOutput: AVCaptureStillImageOutput!
    
// mark - lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySession = AVCaptureSession()
        let devices = AVCaptureDevice.devices()
        
        for device in devices{
            if(device.position == AVCaptureDevicePosition.Back){
                myDevice = device as! AVCaptureDevice
            }
        }

        let videoInput: AVCaptureInput!
        do {
            videoInput = try AVCaptureDeviceInput.init(device: myDevice!)
        }catch{
            videoInput = nil
        }
        
        mySession.addInput(videoInput)
        myImageOutput = AVCaptureStillImageOutput()
        mySession.addOutput(myImageOutput)
        
        
        let myVideoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session:mySession)
        myVideoLayer.frame = self.view.bounds
        myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.view.layer.addSublayer(myVideoLayer)
        
        mySession.startRunning()
        
        // UIボタンを作成.
        let myButton = UIButton(frame: CGRectMake(0,0,120,50))
        myButton.backgroundColor = UIColor.redColor();
        myButton.layer.masksToBounds = true
        myButton.setTitle("撮影", forState: .Normal)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height-50)
        myButton.addTarget(self, action: #selector(CameraViewController.onClickMyButton(_:)), forControlEvents: .TouchUpInside)
        
        // UIボタンをViewに追加.
        self.view.addSubview(myButton);
    }
    
// mark: - private func
    // ボタンイベント.
    func onClickMyButton(sender: UIButton){
        
        // ビデオ出力に接続.
        let myVideoConnection = myImageOutput.connectionWithMediaType(AVMediaTypeVideo)
        
        // 接続から画像を取得.
        self.myImageOutput.captureStillImageAsynchronouslyFromConnection(myVideoConnection, completionHandler: { (imageDataBuffer, error) -> Void in
            
            // 取得したImageのDataBufferをJpegに変換.
            let myImageData : NSData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataBuffer)
            
            // JpegからUIIMageを作成.
            self.imageView.image = UIImage(data: myImageData)!
            
            // アルバムに追加.
            UIImageWriteToSavedPhotosAlbum(self.imageView.image as UIImage!, self, nil, nil)
            
        })
    }

// mark: - memory management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
