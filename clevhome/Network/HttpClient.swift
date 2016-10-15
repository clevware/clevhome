//
//  HttpClient.swift
//  clevhome
//
//  Created by 王卓 on 16/10/15.
//  Copyright © 2016年 Hydrogen. All rights reserved.
//

import Foundation
import Alamofire
class HttpClient{
    class func invoke (
        url:String,
        parameters:[String: Any]? = nil,
        complete:@escaping (_ response: Data?, _ error: Error?) -> Void){
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: [:]).responseJSON { (response) in
            complete(response.data,response.result.error)
        }
    }
    class func invokePost (
        url:String,
        parameters:[String: Any]? = nil,
        complete:@escaping (_ response: Data?, _ error: Error?) -> Void){
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [:]).responseJSON { (response) in
            complete(response.data,response.result.error)
        }
    }
}
