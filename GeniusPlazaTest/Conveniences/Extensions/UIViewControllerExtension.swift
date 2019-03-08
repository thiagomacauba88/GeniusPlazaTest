//
//  UIViewControllerExtension.swift
//  GeniusPlaza
//
//  Created by TechMaxi on 27/09/18.
//  Copyright © 2019 GeniusPlaza. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
        
    func setNavigationTitle(text: String) {
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: text, attributes:[
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.semibold)])
        
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }
}



