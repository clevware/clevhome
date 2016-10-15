//
//  ServiceProxy.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceProxy{
    // MARK: -URL
    fileprivate static var ServiceEndpointBase : String {
        return "http://cleverhome.mybluemix.net/"
    }
    //图片上传

    fileprivate static func getPhotoUpdate() -> String {
        return ServiceEndpointBase + "emotion"
    }
    
    fileprivate static func getControlLight() -> String {
        return ServiceEndpointBase + "control-light"
    }
    //    =======================================
    //    <<          调整灯泡亮度💡             >>
    //    =======================================
    //    [请求地址]
    //    /300Hero/API/equipment
//    internal static func lightBrightnessChange (
//        _ complete:@escaping (_ data:[EquipmentJSON]?,_ rawData:Data,
//        _ error: Error?) -> Void){
//        HttpClient.invoke(url: getEquipmentURL(),parameters: [:]){
//            (response, error) in
//            do{
//                let json = try JSONSerialization.jsonObject(with: response!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
//                let array = json.map{EquipmentJSON(fromDictionary: $0 as! NSDictionary)}
//                complete(array,response!, error)
//            }catch{
//                
//            }
//        }
//    }
    
    internal static func loadObjectList(token:String,page:Int,completeHandle:([String],Error?)->Void){
        HttpClient.invoke(url: "", parameters: [:]) { (data, error) in
            
        }
    }
    
    internal static func setLightBright(lightID:String,brightness:Double,completeHandle:()->Void){
        HttpClient.invoke(url: getControlLight(), parameters: ["id":lightID,"brightness":brightness]) { (data, error) in
            print(data)
        }
    }
    
    internal static func uploadImage(img:Data,completeHandle:()->Void){
        Alamofire.upload(img, to: getPhotoUpdate(), method: .post, headers: [:]).responseJSON { (response) in
            print(response.data!)
            print(response.result.value)
            //complete(response.data,response.result.error)
        }

        
    }
}
