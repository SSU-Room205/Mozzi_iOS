//
//  UIColor+.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/11.
//
import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    
    class var mozziMain: UIColor {
        return UIColor(hex: "#BCEBC4")
    }
    
    class var mozziDark: UIColor {
        return UIColor(r: 158, g: 195,b: 165)
    }
    class var mozziGreen: UIColor {
        return UIColor(hex: "#17A479")
    }
        //위와 같은형식으로 원하는 색상 추가 가능
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
