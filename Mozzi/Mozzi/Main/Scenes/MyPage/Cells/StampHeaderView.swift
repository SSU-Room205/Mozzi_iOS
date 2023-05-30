//
//  StampCollectionReusableView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/23.
//

import UIKit

class StampHeaderView: UICollectionReusableView {
    
    static let identifier = "StampHeaderView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "스탬프"
        label.font = .pretendardBold(ofSize: 20)
        label.textColor = .mozziDark
        return label
    }()
    
    private let recentLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 획득: 나는야 셀럽"
        label.font = .pretendardMedium(ofSize: 14)
        return label
    }()
    
    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.text = "상위 97%"
        label.font = .pretendardMedium(ofSize: 14)
        return label
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(recentLabel,rankingLabel)
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 5
        return stackView
    }()
        
    override func layoutSubviews() {
        setLayout()
    }
    
    private func setLayout(){
        self.addSubviews(titleLabel,stackView)
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(18)
        }
        stackView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(18)
        }
    }
}
