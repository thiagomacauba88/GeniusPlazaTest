//
//  JSON.swift
//  Example
//
//  Created by Thiago Henrique Pereira Freitas on 18/01/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//


import Foundation

class JSON {
    
    class func serialize(dictionary: [String: Any]) -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return jsonData
        } catch {
            // Return nil if serialization fails
            return nil
        }
    }
    
    class func deserialize(data: Data) -> [String: Any]? {
        do {
            let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return jsonDict as? [String: Any]
        } catch {
            return nil
        }
    }
}
