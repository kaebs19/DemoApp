//
//  Extensions+UIButton.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 28/10/2024.
//

import UIKit


extension UIButton {
    
    func custmerButton(text: String  ,bigColor: Colors , color: Colors , typeStyle: styleFont , ofSize: CGFloat ) {
        self.setTitle(text, for: .normal)
        self.backgroundColor = bigColor.uiColor
        self.tintColor = color.uiColor
        self.titleLabel?.font = .systemFont(ofSize: ofSize  , weight: typeStyle.weight)
        
    }
    
    func addRadusWithBoder(text: String? ,raduis: CGFloat , bordercolor: Colors? , Width: CGFloat) {
        self.layer.cornerRadius = raduis
        self.layer.borderColor = bordercolor?.uiColor?.cgColor
        self.layer.borderWidth = Width
    }
    
     func addRadusBut(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    
    
}
