//
//  LoadingConvenience.swift
//  Example
//
//  Created by Thiago on 01/02/19.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import UIKit

class LoadingConvenience {
    
    static let shared = LoadingConvenience()
    
    private var loadingView: UIView!
    private var window = (UIApplication.shared.delegate as! AppDelegate).window!
    
    static var blurView: UIVisualEffectView {
        
        let effect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: effect)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.alpha = 0.85
        
        return view
    }
    
    static var shadowView: UIView {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.55
        return view
    }
    
    static var activityIndicator: UIActivityIndicatorView {
        let loading = UIActivityIndicatorView(style: .whiteLarge)
        loading.color = UIColor.white
        return loading
    }
    
    // MARK: - Life Cycle
    
    init() {
        setupLoadingView()
    }
    
    // MARK: - Misc
    
    func enableFullScreenLoading() {
        window.addSubview(loadingView)
    }
    
    func disableFullScreenLoading() {
        loadingView.removeFromSuperview()
    }
    
    private func setupLoadingView() {
        loadingView = UIView(frame: window.bounds)
        loadingView.startLoading()
    }
    
}
