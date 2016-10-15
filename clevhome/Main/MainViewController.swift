//
//  MainViewController.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import UIKit
class MainTabbarController: UITabBarController {
    
    //    private var indexViewController:IndexViewController!
    //    private var mineViewController:MineViewController!
    
    fileprivate var tabbarItems:[UITabBarItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewControllers()
        configTabbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadViewControllers(){
        func configViewController(_ storyBoard:UIStoryboard,title:String,attr:[String:UIColor],image:UIImage?,selectedImage:UIImage?) -> UINavigationController {
            let viewController = storyBoard.instantiateInitialViewController() as! UINavigationController
            viewController.tabBarItem.image = image
            viewController.tabBarItem.selectedImage = selectedImage
            viewController.navigationItem.title = title
            viewController.tabBarItem.title = title
            viewController.tabBarItem.setTitleTextAttributes(attr, for: UIControlState())
            return viewController
        }
        
        let color = [NSForegroundColorAttributeName:UIColor.white]
        let indexViewController = configViewController(R.storyboard.index(), title: "设备", attr: color, image: nil, selectedImage: nil)
        
        let searchViewController = configViewController(R.storyboard.control(), title: "控制", attr: color, image: nil, selectedImage: nil)
        
        let mineViewController = configViewController(R.storyboard.account(), title: "账号", attr: color, image: nil, selectedImage: nil)
        
        self.viewControllers = [
            indexViewController,
            searchViewController,
            mineViewController
        ]
        self.selectedIndex = 0
    }
    
    func configTabbar(){
        UITabBar.appearance().barTintColor = UIColor.darkGray
        UITabBar.appearance().tintColor = UIColor.white
    }
    
}
