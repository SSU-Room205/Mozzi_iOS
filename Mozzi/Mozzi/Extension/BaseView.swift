//
//  BaseView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/17.
//

import UIKit

public protocol Layout {
    func setViewHierarchy()
    func setConstraints()
}

public typealias BaseView = BaseViewClass & Layout

open class BaseViewClass: UIView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setLayouts() {
        guard let baseView = self as? BaseView else { return }

        baseView.setViewHierarchy()
        baseView.setConstraints()
    }
}
