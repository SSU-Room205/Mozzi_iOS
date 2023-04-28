//
//  OCRImportView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/19.
//

import UIKit
import SnapKit

final class OCRImportView: BaseView{
    
    lazy var ocrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var placeStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(placeItemView, placetextField)
        stackView.spacing = 20
        return stackView
    }()
    
    private let placeItemView : UILabel = {
        let label = UILabel()
        label.text = "상호명"
        label.font = .pretendardBold(ofSize: 14)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    lazy var placetextField : UITextField = {
        let textField = UITextField()
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private lazy var addressStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(addresslabel, addresstextField)
        stackView.spacing = 20
        return stackView
    }()
    
    private let addresslabel : UILabel = {
        let label = UILabel()
        label.text = "주소"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var addresstextField : UITextField = {
        let textField = UITextField()
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private lazy var itemStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(itemLabel, itemtextField)
        stackView.spacing = 20
        return stackView
    }()
    
    private let itemLabel : UILabel = {
        let label = UILabel()
        label.text = "상품명"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var itemtextField : UITextField = {
        let textField = UITextField()
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private lazy var amountStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(amountLabel, amounttextField)
        stackView.spacing = 20
        return stackView
    }()
    
    private let amountLabel : UILabel = {
        let label = UILabel()
        label.text = "수량"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var amounttextField : UITextField = {
        let textField = UITextField()
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private lazy var priceStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(priceLabel, pricetextField)
        stackView.spacing = 20
        return stackView
    }()
    
    private let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var pricetextField : UITextField = {
        let textField = UITextField()
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private lazy var totalPriceStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(totalPriceLabel, totalPricetextField)
        stackView.spacing = 20
        return stackView
    }()
    
    private let totalPriceLabel : UILabel = {
        let label = UILabel()
        label.text = "총액"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var totalPricetextField : UITextField = {
        let textField = UITextField()
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private lazy var dataStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(dateLabel, dateTextField)
        stackView.spacing = 20
        return stackView
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.text = "날짜 일시"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var dateTextField : UITextField = {
        let textField = UITextField()
        textField.font = .pretendardMedium(ofSize: 14)
        return textField
    }()
    
    private lazy var informationStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(placeStackView, addressStackView, itemStackView, amountStackView, priceStackView, totalPriceStackView, dataStackView)
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()

    
    func setViewHierarchy() {
        addSubviews(ocrImageView, informationStackView)
    }
    
    func setConstraints() {
        ocrImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(428)
        }
        
        [placeItemView,addresslabel,itemLabel,amountLabel,priceLabel,totalPriceLabel,dateLabel].forEach{
            $0.snp.makeConstraints{
                $0.width.equalTo(65)
            }
        }
        
        informationStackView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(ocrImageView.snp.bottom).offset(20)
        }
        
    }
    
    func setInformation(_ place : String, _ address : String,_ item: [String], _ amount: [String],_ price: [String], _ totalPrice: String, _ date: String ){
        placetextField.text = place
        addresstextField.text = address
        itemtextField.text = appendString(item)
        amounttextField.text = appendString(amount)
        pricetextField.text = appendString(price)
        totalPricetextField.text = totalPrice
        dateTextField.text = date
    }
    
    func appendString(_ array: [String])->String{
        var string: String = array[0]
        for i in 1 ..< array.count {
            string.append(" / " + array[i])
        }
        return string
    }
    
    
}
