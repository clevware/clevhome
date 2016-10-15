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
        return "https://clevho.mybluemix.net/" //"http://10.221.64.169:8090"
    }
    //图片上传

    fileprivate static func getPhotoUpdate() -> String {
        return ServiceEndpointBase + "emotion"
    }
    
    fileprivate static func getControlLight() -> String {
        return ServiceEndpointBase + "control-light"
    }
    
    fileprivate static func getVoiceRecgnuize() -> String {
        return ServiceEndpointBase + "control-light"
    }
    
    fileprivate static func getSendEmotionURL() -> String {
        return ServiceEndpointBase + "emotion-json"
    }
    fileprivate static func getObjectList() -> String {
        return ServiceEndpointBase + "all-light-brightness"
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
    
    internal static func loadObjectList(token:String,page:Int,completeHandle:@escaping ([Device],Error?)->Void){
        HttpClient.invokePost(url: getObjectList(), parameters: [:]) { (data, error) in
            let json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            let array = (json as! NSDictionary).map({ (id,state) -> Device in
                Device(id: id as! String,state: state as! Int)
            })
            completeHandle(array,error)
        }
    }
    
    internal static func setLightBright(lightID:String,brightness:Double,completeHandle:()->Void){
        HttpClient.invoke(url: getControlLight(), parameters: ["id":lightID,"brightness":brightness]) { (data, error) in
            print(data)
        }
    }
    
    
    internal static func uploadImage(img:Data,completeHandle:(EmotionJSON)->Void){

        EmotionRecognition.getEmotion(from: img) { (data, reponse) in
            sendEmotionJSON(json: data!)
            let emotionData = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(emotionData)
        }
    }
    
    private static func sendEmotionJSON(json:Data){
        HttpClient.invoke(url: getSendEmotionURL(), parameters: ["data":json]) { (data, error) in
            let json = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(json)
        }
    }
    
    private static func getEmotion(from data: Data, completionHandler: @escaping (Data?, URLResponse?) -> Void) {
        let session = URLSession.shared
        let url = URL(string: ERConfig.urlPathStr)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        let task = session.dataTask(with: (request as URLRequest)) { (data, reponse, error) in
            completionHandler(data, reponse)
        }
        task.resume()
    }
}
