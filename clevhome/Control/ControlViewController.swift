//
//  ControlController.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import UIKit
class ControlViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func takePhoto(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            //self?.alertCanNotOpenCamera()
            alertMessage(title: "错误", msg: "摄像头无法启用")
            return
        }
        let imagePicker = UIImagePickerController()
        //设置代理
        imagePicker.delegate = self
        //允许编辑
        imagePicker.allowsEditing=false
        //设置图片源
        imagePicker.sourceType = .camera
        //模态弹出IamgePickerView
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let editedImg: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        DispatchQueue(label: "work").async {
            ServiceProxy.uploadImage(img: UIImagePNGRepresentation(editedImg)!)
        }
    }
    
    
    @IBAction func voiceControl(_ sender: UIButton) {
        
    }
    
    

}
