//
//  HorizontalScrollView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/14.
//


import Foundation
import UIKit
import SnapKit



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
 //       let VC = MainViewController()
        dataSource?.forEach { data in
            let view = UIView()
            view.backgroundColor = .mozziMain
            stackView.addArrangedSubview(view)
            view.makeCornerRound(radius: 40)
            view.makeShadow(radius: 0, offset: CGSize(width: 3, height: 3), opacity: 0.8)
            view.layer.shadowColor = UIColor.mozziDark.cgColor
  //          view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(VC.viewTapped)))
            view.snp.makeConstraints{
                $0.width.equalTo(150)
                $0.height.equalTo(80)
            }
        }
        
        
        
    }
}
