//
//  Device.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import Foundation
struct Device {
    var id:String
    var type:DeviceType = .blub
    var state:DeviceState
    var desc:String = "我的灯泡"
    
    init(json: NSDictionary) {
        id = json.allKeys[0] as! String
        if json["id"] as! Int == 0{
            state = .off
        }else{
            state = .on
        }
    }
    
    init(id:String,state:Int) {
        self.id = id
        if state == 0{
            self.state = .off
        }else{
            self.state = .on
        }
    }
}


enum DeviceType:String{
    case blub = "电灯"
}

enum DeviceState:String{
    case on = " ON "
    case off = " OFF "
}
