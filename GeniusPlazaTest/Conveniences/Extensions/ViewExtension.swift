//
//  ViewExtension.swift
//  Example
//
//  Created by Thiago on 01/02/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import UIKit

fileprivate let loadingViewIdentifier = 101010

extension UIView {
    
    func startLoading(_ shadow: Bool = true) {
        let loadingView = UIView()
        loadingView.frame = self.bounds
        loadingView.tag = loadingViewIdentifier
        
        let activityIndicator = LoadingConvenience.activityIndicator
        activityIndicator.frame = self.bounds
        activityIndicator.startAnimating()
        
        if shadow {
            let shadowView = LoadingConvenience.shadowView
            shadowView.frame = self.bounds
            loadingView.addSubview(shadowView)
        }
        
        loadingView.addSubview(activityIndicator)
        
        DispatchQueue.main.async {
            self.addSubview(loadingView)
        }
    }
    
    func stopLoading() {
        let holderView = self.viewWithTag(loadingViewIdentifier)
        DispatchQueue.main.async {
            holderView?.removeFromSuperview()
        }
    }
}
