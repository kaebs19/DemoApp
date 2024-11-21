//
//  Extensions+UIView.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 27/10/2024.
//

import UIKit

extension UIView {
    func addRadus(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func addBoder(color: Colors , wight: CGFloat) {
        self.layer.borderColor = color.uiColor?.cgColor
        self.layer.borderWidth = wight
    }
    
    func addShadow(color: Colors , opacity: Float , radius: CGFloat , offset: CGSize) {
        self.layer.shadowColor = color.uiColor?.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
    }
}
