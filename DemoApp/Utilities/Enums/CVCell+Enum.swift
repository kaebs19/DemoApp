//
//  CVCell+Enum.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 21/11/2024.
//

import Foundation


enum CVCellEnum: String {
    case  ProductsCVCell = "ProductsCVCell"
    case CategoryCVCell =  "CategoryCVCell"
    case CategoriesCVCellHome = "CategoriesCVCellHome"
    case ProductsCVCellHome = "ProductsCVCellHome"
    case SliderCVCellHome = "SliderCVCellHome"
    
    var identifier: String {
        return self.rawValue
    }

}
