//
//  HomeViewModel.swift
//  GeniusPlazaTest
//
//  Created by Thiago on 07/03/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewModel {

    // MARK: - Properties
    let service = HomeServices()
    var homeResponse: HomeResponse?
    
    // MARK: - Service
    func musicList(mediaType: String) -> Observable<HomeResponse?> {
        return Observable.create { observable in
            self.service.musicList(mediaType: mediaType, success: { (home, serviceResponse) in
                if let response = home  {
                    self.homeResponse = response
                    observable.onNext(self.homeResponse)
                }
            }, onFailure: { (serviceResponse) in
                if let error = serviceResponse?.serviceError {
                    observable.onError(error)
                }
            }, onCompletion: {
                observable.onCompleted()
            })
            return Disposables.create()
        }
    }
}
