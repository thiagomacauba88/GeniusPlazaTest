//
//  HomeServices.swift
//  Example
//
//  Created by Thiago on 12/02/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import UIKit

class HomeServices {

    // MARK: Get Url Strings
    func getChangePasswordUrl(mediaType: String) -> String {
        var url = URLInfo.url(fromKey: "home")
        url = url.replacingOccurrences(of: "{mediaType}", with: mediaType)
        return url
    }
    
    func musicList(mediaType: String, success: @escaping ((_ sucessObject: HomeResponse?, _ serviceResponse: ServiceResponse?) -> Void), onFailure failure:((ServiceResponse?) -> Void)? = nil, onCompletion completion:(() -> Void)? = nil) {
        if let url = URL(string: getChangePasswordUrl(mediaType: mediaType)) {
            Service.shared.request(httpMethod: .get, url: url, payload: nil, auth: true).response(succeed: { (_ homeResponse: HomeResponse?, _ serviceResponse: ServiceResponse?) in
                if let response = homeResponse, let content = serviceResponse {
                    success(response, content)
                }
            }, failed: { (errorResponse) in
                failure?(errorResponse)
            }, completed: {
                completion?()
            })
        }
    }
}
