//
//  UIFont+.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/25.
//

import UIKit

extension UIFont {
    
    static func pretendardBlack(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Black", size: size)!
    }
    
    static func pretendardBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
    
    static func pretendardSemiBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-SemiBold", size: size)!
    }
    
    static func pretendardMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: size)!
    }
    static func pretendardThin(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Thin", size: size)!
    }
}

enum Pretendard {
        // 1)
    case ExtraLight
    case Light
    case Thin
    case Regular
    case Medium
    case SemiBold
    case Bold
    case ExtraBold
    case Black
    
        // 2)
    func fontName() -> String {
        switch self {
        case .ExtraLight: return "PretendardVariable-ExtraLight"
        case .Light: return "PretendardVariable-Light"
        case .Thin: return "PretendardVariable-Thin"
        case .Regular: return "PretendardVariable-Regular"
        case .Medium: return "PretendardVariable-Medium"
        case .SemiBold: return "PretendardVariable-SemiBold"
        case .Bold: return "PretendardVariable-Bold"
        case .ExtraBold: return "PretendardVariable-ExtraBold"
        case .Black: return "PretendardVariable-Black"
        }
    }
    
        // 3)
    func fontSize(style: UIFont.TextStyle) -> CGFloat {
        switch style {
        case .largeTitle: return 34.0
        case .title1: return 28.0
        case .title2: return 22.0
        case .title3: return 20.0
        case .headline: return 18.0
        case .body: return 17.0
        case .callout: return 16.0
        case .subheadline: return 15.0
        case .footnote: return 13.0
        case .caption1: return 12.0
        case .caption2: return 11.0
        default: return 17.0
        }
    }
}

extension UIFont {
    static func CustomPretendarFont(_ font: Pretendard, forTextStyle style: UIFont.TextStyle, overrideFontSize: UIContentSizeCategory? = nil) -> UIFont? {
        guard let customFont = UIFont(name: font.fontName(), size: font.fontSize(style: style)) else { return nil }
        let scaledFont: UIFont
        let metrics = UIFontMetrics(forTextStyle: style)
        scaledFont = metrics.scaledFont(for: customFont, compatibleWith: UITraitCollection(preferredContentSizeCategory: overrideFontSize ?? .unspecified))
        return scaledFont
    }
}
