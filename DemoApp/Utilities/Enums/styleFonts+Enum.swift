//
//  styleFonts.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 28/10/2024.
//

import UIKit


enum styleFont {
    case regular
    case semibold
    case bold
    
    var weight: UIFont.Weight {
        switch self {
        case .bold:
            return .bold
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        }
    }
}
