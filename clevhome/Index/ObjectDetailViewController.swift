//
//  ObjectDetailViewController.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import UIKit
import SnapKit
class ObjectDetailViewController: UIViewController {
    @IBOutlet weak var bulb: UIImageView!
    @IBOutlet weak var darkbulb: UIImageView!
    
    var lightOn:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        if !lightOn{switchState()}
        darkbulb.isUserInteractionEnabled = true
        darkbulb.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.switchState)))
        bulb.isUserInteractionEnabled = true
        bulb.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.switchState)))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchState() {
        if lightOn!{
            ServiceProxy.setLightBright(lightID: "1", brightness: 100, completeHandle: { 
                
            })
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: {
                self.bulb.alpha = 1
                }, completion: { (bool) in
                    
            })
        }else{
            ServiceProxy.setLightBright(lightID: "1", brightness: 0, completeHandle: {
                
            })
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: [], animations: {
                self.bulb.alpha = 0
                }, completion: { (bool) in
                    
            })
        }
        lightOn = !lightOn
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
