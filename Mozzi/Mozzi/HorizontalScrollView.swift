//
//  HorizontalScrollView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/02/27.
//

import Foundation
import SnapKit

class HorizontalScrollView: BaseScrollView {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 30.0
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
            button.layer.cornerRadius = 30
            button.setTitleColor(.darkGray, for: .normal)
            button.setTitle(data.name, for: .normal)
           // button.setImage(data.iamge, for: .normal)
           // button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -4.0, bottom: 0.0, right: 0.0)
            button.backgroundColor = .white

            stackView.addArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.width.equalTo(240)
                make.top.equalToSuperview().offset(15)
                make.bottom.equalToSuperview().offset(-15)
            }
        }
    }
}
