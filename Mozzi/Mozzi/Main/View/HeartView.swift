//
//  HeartView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/18.
//

import UIKit
import SnapKit

class HeartView: BaseView {
    
    private lazy var heartOneButton: UIButton = setHeartButton()
    private lazy var heartTwoButton: UIButton = setHeartButton()
    private lazy var heartThreeButton: UIButton = setHeartButton()
    private lazy var heartFourButton: UIButton = setHeartButton()
    private lazy var heartFiveButton: UIButton = setHeartButton()
    
    private lazy var heartStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.addArrangeSubViews(heartOneButton,heartTwoButton,heartThreeButton,heartFourButton,heartFiveButton)
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    var buttonIsSelected: Bool = false
    
    
    func setViewHierarchy() {
        self.addSubviews(heartStackView)
    }
    
    func setConstraints() {
        heartStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setHeartButton() -> UIButton{
        let button = UIButton()
        button.setImage(Images.emptyHeartImage, for: .normal)
        button.setImage(Images.fillHeartImage, for: .selected)
        button.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        return button
    }
    
    @objc func heartButtonDidTap(_ sender: UIButton){
        buttonIsSelected = !buttonIsSelected
        sender.isSelected = buttonIsSelected
    }
}
