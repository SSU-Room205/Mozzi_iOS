//
//  UIStackView+.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/10.
//

import UIKit

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
            views.forEach { self.addArrangedSubview($0) }
        }
    
    func clearSubViews() {
        self.arrangedSubviews.forEach{
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
