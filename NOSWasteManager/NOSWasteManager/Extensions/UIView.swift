//
//  UIView.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 14/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor(red: 0.34, green: 0.34, blue: 0.34, alpha: 0.2).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 15
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.masksToBounds = false
        layer.bounds = self.bounds
        layer.position = self.center
        
        updateShadow()
    }
    
    func updateShadow() {
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius:5).cgPath
    }
}
