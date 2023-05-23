//
//  WishListCollectionViewCell.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/23.
//

import UIKit

class WishListCollectionViewCell: UICollectionViewCell,CollectionViewCellReuseProtocol {
   //MARK: - UI Components
    private let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    
     let wishImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.backgroundColor = .systemGray6
         imageView.makeCornerRound(radius: 5)
         imageView.makeBorder(width: 1, color: .mozziDark)
        return imageView
    }()
    
    lazy var appendButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로 등록", for: .normal)
        button.setTitleColor(.mozziMain, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
    }()
    
    private let newButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(named: "main Color"), for: .normal)
        button.setTitle("New", for: .normal)
        button.titleLabel?.font = .pretendardMedium(ofSize: 14)
        button.makeCornerRound(radius: 12.5 )
        button.backgroundColor = .white
        button.makeBorder(width: 1, color: .mozziMain)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 50, height: 50)
        button.makeCornerRound(radius: 25)
        button.backgroundColor = .white
        button.makeBorder(width: 1, color: .mozziMain)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.mozziMain, for: .normal)
        button.titleLabel?.font = .pretendardBold(ofSize: 36)
        return button
    }()
    
    private let valButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Val", for: .normal)
        button.backgroundColor = .mozziMain
        button.makeCornerRound(radius: 12.5 )
        button.titleLabel?.font = .pretendardMedium(ofSize: 14)
        return button
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 50, height: 50)
        button.makeCornerRound(radius: 25)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .mozziMain
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .pretendardBold(ofSize: 36)
        return button
    }()
    
    
    
    private lazy var newButtonStack: UIStackView = {
       let stackView = UIStackView()
        stackView.addArrangeSubViews(newButton,minusButton)
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var valButtonStack: UIStackView = {
       let stackView = UIStackView()
        stackView.addArrangeSubViews(valButton,plusButton)
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var wishStackView:UIStackView  = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(wishImageView,newButtonStack,valButtonStack)
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let valSlider: UISlider = {
       let slider = UISlider()
        slider.tintColor = .mozziMain
        slider.minimumValue = 0
        slider.maximumValue = 100000
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension WishListCollectionViewCell {
    func setLayout() {
        wishImageView.addSubview(appendButton)
        addSubviews(wishStackView,valSlider)
        
        wishImageView.snp.makeConstraints{
            $0.width.equalTo(180)
        }
        
        [plusButton,minusButton].forEach {
            $0.snp.makeConstraints{
                $0.size.equalTo(50)
            }
        }
        
        appendButton.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        wishStackView.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        valSlider.snp.makeConstraints{
            $0.top.equalTo(wishStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
