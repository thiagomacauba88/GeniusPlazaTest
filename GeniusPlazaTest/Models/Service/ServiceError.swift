//
//  ServiceError.swift
//  Example
//
//  Created by Thiago Henrique Pereira Freitas on 18/01/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import Foundation

struct ServiceError: Codable, Error {
  
  // MARK: - Properties
  var code: String? 
  var title: String?
  var detail: String?
  
  var statusCode: Int?
  var error: String?
  var message: String?
  
}
