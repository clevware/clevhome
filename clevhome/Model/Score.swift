//
//	Score.swift
//  on 16/10/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Score{

	var anger : Double!
	var contempt : Float!
	var disgust : Double!
	var fear : Double!
	var happiness : Float!
	var neutral : Float!
	var sadness : Float!
	var surprise : Double!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		anger = dictionary["anger"] as? Double
		contempt = dictionary["contempt"] as? Float
		disgust = dictionary["disgust"] as? Double
		fear = dictionary["fear"] as? Double
		happiness = dictionary["happiness"] as? Float
		neutral = dictionary["neutral"] as? Float
		sadness = dictionary["sadness"] as? Float
		surprise = dictionary["surprise"] as? Double
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if anger != nil{
			dictionary["anger"] = anger
		}
		if contempt != nil{
			dictionary["contempt"] = contempt
		}
		if disgust != nil{
			dictionary["disgust"] = disgust
		}
		if fear != nil{
			dictionary["fear"] = fear
		}
		if happiness != nil{
			dictionary["happiness"] = happiness
		}
		if neutral != nil{
			dictionary["neutral"] = neutral
		}
		if sadness != nil{
			dictionary["sadness"] = sadness
		}
		if surprise != nil{
			dictionary["surprise"] = surprise
		}
		return dictionary
	}

}
