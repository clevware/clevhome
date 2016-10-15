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
    @IBOutlet weak var icon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn{
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: { 
                self.icon.alpha = 1
                }, completion: { (bool) in
                    
            })
        }else{
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: [], animations: {
                self.icon.alpha = 0
                }, completion: { (bool) in
                    
            })
        }
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
