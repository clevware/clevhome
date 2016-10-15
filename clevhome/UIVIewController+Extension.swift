//
//  UIVIewController+Extension.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//


import UIKit
extension UIViewController{
    func alertMessage(title:String,msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
}
