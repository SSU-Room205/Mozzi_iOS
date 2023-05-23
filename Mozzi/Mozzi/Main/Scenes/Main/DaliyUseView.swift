//
//  DaliyUseView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/26.
//

import UIKit
import SnapKit

class DaliyUseView : BaseView {
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.font = .pretendardMedium(ofSize: 14)
        label.textColor = .mozziGreen
        return label
    }()
    
    private let itemLabel: UILabel = {
       let label = UILabel()
        label.font = .pretendardMedium(ofSize: 16)
        label.textColor = .white
        return label
    }()
    

    
    private lazy var labelStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(priceLabel, itemLabel)
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    
    func setViewHierarchy() {
        self.addSubviews(labelStackView)
    }
    
    func setConstraints() {
        self.backgroundColor = .mozziMain
        self.makeCornerRound(radius: 40)
        self.makeShadow(radius: 0, offset: CGSize(width: 3, height: 3), opacity: 0.8)
        self.layer.shadowColor = UIColor.mozziDark.cgColor
        labelStackView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(30)
        }
    }
    
    func configure(_ Consum1: Consum1) {
        self.itemLabel.text = Consum1.itemName
        self.priceLabel.text = Consum1.price + "₩"
    }
    
    
}
