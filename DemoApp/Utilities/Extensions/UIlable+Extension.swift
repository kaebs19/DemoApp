//
//  Extensions+Lable.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 28/10/2024.
//

import UIKit

extension UILabel {
    
    func custmeLable(text: String , ofSize: CGFloat , color: Colors? , typeStyle:styleFont) {
        
        self.text = text
        self.font = .systemFont(ofSize: ofSize)
        self.textColor =  color?.uiColor
        self.font = .systemFont(ofSize: ofSize, weight: typeStyle.weight)
    }
}


