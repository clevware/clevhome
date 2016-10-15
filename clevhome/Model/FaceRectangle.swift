//
//	FaceRectangle.swift
//  on 16/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct FaceRectangle{

	var height : Int!
	var left : Int!
	var top : Int!
	var width : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		height = dictionary["height"] as? Int
		left = dictionary["left"] as? Int
		top = dictionary["top"] as? Int
		width = dictionary["width"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if height != nil{
			dictionary["height"] = height
		}
		if left != nil{
			dictionary["left"] = left
		}
		if top != nil{
			dictionary["top"] = top
		}
		if width != nil{
			dictionary["width"] = width
		}
		return dictionary
	}

}
