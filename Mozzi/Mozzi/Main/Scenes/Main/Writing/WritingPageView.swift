//
//  CameraView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/17.
//

import UIKit
import SnapKit

final class WritingPageView: BaseView {
    
    //MARK: Property
    private let textViewPlaceHolder = "기억에 남는 순간을 기록으로 남겨 보세요 :)"
    private var isSelected: Bool = false
    var category: String?
    
    
    //MARK: UIComponents
    lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.addImageButtonImage?.withTintColor(.mozziMain), for: .normal)
        return button
    }()
    
   lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.makeBorder(width: 1, color: .mozziDark)
        imageView.makeCornerRound(radius: 10)
       imageView.isUserInteractionEnabled = true
       imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var itemTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "품목을 입력해주세요"
        textField.font = .pretendardBold(ofSize: 20)
        return textField
    }()
    
    lazy var placeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "장소 이름을 입력해주세요"
        textField.font = .pretendardMedium(ofSize: 16)
        return textField
    }()
    
    lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "주소를 입력해주세요"
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private let wonLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        label.text = "₩ "
        label.font = .pretendardBold(ofSize: 16)
        return label
    }()
    
    lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "가격을 입력해주세요"
        textField.keyboardType = .numberPad
        textField.font = .pretendardMedium(ofSize: 16)
        textField.leftView = wonLabel
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var infomationStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(itemTitleTextField,placeTextField,addressTextField,priceTextField)
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    
    private lazy var writingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(placeImageView,infomationStackView)
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.alignment = .center
        return stackView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = .pretendardBold(ofSize: 16)
        return label
    }()
    
    private lazy var categoryButtonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(eattingButton,shoppingButton,cafeButton,moreCategoryButton)
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var eattingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 25))
        button.setTitle("식사", for: .normal)
        button.setTitleColor(.mozziMain, for: .normal)
        button.titleLabel?.font = .pretendardMedium(ofSize: 14)
        button.makeBorder(width: 2, color: .mozziMain)
        button.makeCornerRound(radius: 12.5)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(categoryButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var shoppingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 25))
        button.setTitle("쇼핑", for: .normal)
        button.setTitleColor(.mozziMain, for: .normal)
        button.titleLabel?.font = .pretendardMedium(ofSize: 14)
        button.makeBorder(width: 2, color: .mozziMain)
        button.makeCornerRound(radius: 12.5)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(categoryButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var cafeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 25))
        button.setTitle("카페", for: .normal)
        button.setTitleColor(.mozziMain, for: .normal)
        button.titleLabel?.font = .pretendardMedium(ofSize: 14)
        button.makeBorder(width: 2, color: .mozziMain)
        button.makeCornerRound(radius: 12.5)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(categoryButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var moreCategoryButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.moreCategoryButtonImage, for: .normal)
        return button
    }()
    
    private lazy var categoryStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(categoryLabel,categoryButtonStackView)
        stackView.spacing = 30
        stackView.alignment = .firstBaseline

        return stackView
    }()
    
    private let heartLabel: UILabel = {
        let label = UILabel()
        label.text = "만족도"
        label.font = .pretendardBold(ofSize: 16)
        return label
    }()
    
    private let heartView = HeartView()
    
    private lazy var heartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(heartLabel,heartView)
        return stackView
    }()
    

    private lazy var WritingPageStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(writingStackView, categoryStackView,heartStackView)
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private let divideView: UIView = {
       let view = UIView()
        view.backgroundColor = .mozziMain
        return view
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .pretendardMedium(ofSize: 14)
        textView.text = textViewPlaceHolder
        textView.textColor = .placeholderText
        return textView
    }()
    
    //MARK: Action
    
    
    @objc func categoryButtonDidTap(_ sender: UIButton) {
        let buttons = [cafeButton, shoppingButton, eattingButton] // 버튼들의 배열
        let selectedButton = buttons.filter { $0.isSelected }.first // 현재 선택된 버튼
        
        // 선택된 버튼이 이미 있다면 선택 해제
        if let selectedButton = selectedButton {
            selectedButton.isSelected = false
            selectedButton.backgroundColor = .white
            selectedButton.setTitleColor(.mozziMain, for: .normal)
        }
        
        isSelected = !isSelected
        
        if isSelected == true {
            sender.isSelected = true
            sender.backgroundColor = .mozziMain
            sender.setTitleColor(.white, for: .normal)
        } else {
            sender.backgroundColor = .white
            sender.setTitleColor(.mozziMain, for: .normal)
        }
        
        category = sender.titleLabel?.text
    }
    
    func setPlaceImage(image: UIImage){
        addPhotoButton.isHidden = true
        placeImageView.image = image
    }
    
    
    func setViewHierarchy() {
        self.addSubviews(WritingPageStackView,divideView, textView,addPhotoButton)
    }
    
    func setConstraints() {
        
        placeImageView.snp.makeConstraints{
            $0.width.height.equalTo(130)
        }
        
        addPhotoButton.snp.makeConstraints{
            $0.size.equalTo(30)
            $0.center.equalTo(placeImageView.snp.center )
        }
        
        WritingPageStackView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(100)
        }
        
        divideView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().offset(5)
            $0.height.equalTo(1)
            $0.top.equalTo(WritingPageStackView.snp.bottom).offset(20)
        }
        
        textView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(divideView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        [eattingButton,shoppingButton,cafeButton].forEach{
            $0.snp.makeConstraints{
                $0.height.equalTo(25)
                $0.width.equalTo(65)
            }
        }
    }

}

