//
//  Comors.swift
//  DemoApp
//
//  Created by Mohammed Saleh on 27/10/2024.
//
import UIKit

enum Colors: String {
    case CFFFFFF_whith = "#FFFFFF"
    case CF1EFF1 = "#F1EFF1"
    case C454545_Black = "#454545"
    case C0079FB_blue = "#0079FB"
    case CF8F8F8_TabBar = "#8F8F8F"
    case CD9D9D9_Gray = "#9D9D9D"
    case C989898_Gray = "#989898"
    case C58595B_black = "#58595B"
    case C24955C_green = "#24955C"
    case CDB0000_red = "#CDB000"
    case CBFBFBF_gry = "#BFBFBF"
    case C707070_gray = "#707070"
    case CE2E2E2  = "#E2E2E2"
    
    var uiColor: UIColor? {
        return UIColor(hex: self.rawValue)
    }

}

extension UIColor {
    
    convenience init?(hex: String) {
        // حذف أي مسافات أو رموز #
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexFormatted = hexFormatted.replacingOccurrences(of: "#", with: "")
        
        // التحقق من أن طول السلسلة 6، مثل #FFFFFF
        guard hexFormatted.count == 6,
              let rgbValue = UInt(hexFormatted, radix: 16) else { return nil }
        
        // استخراج قيم الأحمر، الأخضر، الأزرق من قيمة hex
        let red = CGFloat((rgbValue >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgbValue >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

