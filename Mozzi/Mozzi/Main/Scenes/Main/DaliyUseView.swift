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
        label.font = .pretendardMedium(ofSize: 12)
        label.textColor = .mozziGreen
        return label
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
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
        
        labelStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(30)
            $0.trailing.lessThanOrEqualToSuperview().offset(-30) // 추가: 오른쪽 여백을 30으로 설정
        }
        
        // 추가: DaliyUseView의 너비를 labelStackView에 맞게 설정
        self.snp.makeConstraints {
                $0.leading.trailing.equalTo(labelStackView).inset(-30) // 추가: DaliyUseView의 가장자리를 labelStackView에 맞추어 설정
                $0.width.greaterThanOrEqualTo(0) // 추가: 너비는 최소값 0으로 설정
            }
    }
    
    func configureCell(item: String, price: String){
        itemLabel.text = item
        priceLabel.text = "￦ \(price)"
    }
    
}
