//
//  Image+Enum.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 19/11/2024.
//

import Foundation
import UIKit

enum Images: String {
    
    case SELECT_IMG = "select"
    case UN_SELECT_IMG = "unSelect"
    case STAR_SEL_IMG =  "star_sel"
    case STAR_UNSEL_IMG = "star_unsel"
    
    var image: UIImage {
        return UIImage(named: rawValue)!
    }
}
