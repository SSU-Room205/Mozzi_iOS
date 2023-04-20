//
//  BaseScrollView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/19.
//

import UIKit

class BaseScrollView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented xib init")
    }

    func configure() {}
    func bind() {}
}
