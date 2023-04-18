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
        return UIColor(r: 158, g: 195, b: 165)
    }
    
    class var mozziDark: UIColor {
        return UIColor(r: 158, g: 195,b: 165)
    }
        //위와 같은형식으로 원하는 색상 추가 가능
}
