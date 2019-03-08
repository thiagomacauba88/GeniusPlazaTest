//
//  ServiceResponse.swift
//  Example
//
//  Created by Thiago Henrique Pereira Freitas on 18/01/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import Foundation

struct ServiceResponse {
    
    // MARK: - Properties
    var data: Data?
    
    var rawResponse: String?
    var response: HTTPURLResponse?
    var request: URLRequest?

    var serviceError: ServiceError?
    
}
