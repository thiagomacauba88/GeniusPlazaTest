//
//  URLInfo.swift
//  Example
//
//  Created by Thiago Henrique Pereira Freitas on 18/01/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import UIKit

class URLInfo {

    static func url(fromKey key: String) -> String {
        guard
            let path = Bundle.main.path(forResource: "URLs", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: String]
            else {
                return ""
        }
        
        if let url = dict[key] {
            return (url)
        } else {
            return ""
        }
    }
}
