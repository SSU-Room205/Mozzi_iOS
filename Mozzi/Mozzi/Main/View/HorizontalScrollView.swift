//
//  HorizontalScrollView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/14.
//


import Foundation
import UIKit
import SnapKit


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


class HorizontalScrollView: BaseScrollView {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        view.spacing = 30
        return view
    }()
    
    var dataSource: [SomeDataModel]? {
         didSet { bind() }
     }
    
    override func configure() {
            super.configure()

            showsHorizontalScrollIndicator = false
            bounces = false

            addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview() /// 이 값이 없으면 scroll 안되는 것 주의
                make.height.equalToSuperview()
            }
        }
    override func bind() {
        super.bind()

        dataSource?.forEach { data in
            let button = UIButton()
            button.makeCornerRound(radius: 40)
            button.makeShadow(radius: 0, offset: CGSize(width: 3, height: 3), opacity: 0.8)
            button.layer.shadowColor = UIColor.mozziDark.cgColor
            button.setTitleColor(.darkGray, for: .normal)
            button.setTitle(data.name, for: .normal)
            button.backgroundColor = .mozziMain

            stackView.addArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.width.equalTo(150)
                make.height.equalTo(80)
            }
        }
    }
}
