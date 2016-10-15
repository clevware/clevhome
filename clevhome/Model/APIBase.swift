//
//	APIBase.swift
//  on 16/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct APIBase{

	var faceRectangle : FaceRectangle!
	var scores : Score!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let faceRectangleData = dictionary["faceRectangle"] as? NSDictionary{
				faceRectangle = FaceRectangle(fromDictionary: faceRectangleData)
			}
		if let scoresData = dictionary["scores"] as? NSDictionary{
				scores = Score(fromDictionary: scoresData)
			}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if faceRectangle != nil{
			dictionary["faceRectangle"] = faceRectangle.toDictionary()
		}
		if scores != nil{
			dictionary["scores"] = scores.toDictionary()
		}
		return dictionary
	}

}
