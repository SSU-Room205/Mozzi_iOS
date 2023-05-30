//
//  OCRImportView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/19.
//

import UIKit
import SnapKit

final class OCRImportView: BaseView{
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    lazy var ocrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(ocrImageView,informationStackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
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
        stackView.addArrangeSubViews(itemLabel, itemTextView)
        stackView.spacing = 20
        return stackView
    }()
    
    private let itemLabel : UILabel = {
        let label = UILabel()
        label.text = "상품명"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var itemTextView : UITextView = {
        let textView = UITextView()
        textView.font = .pretendardMedium(ofSize: 14)
        return textView
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
        stackView.addArrangeSubViews(priceLabel, priceTextField)
        stackView.spacing = 20
        return stackView
    }()
    
    private let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    lazy var priceTextField : UITextField = {
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(mainStackView)
    }
    
    func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        [placeItemView,addresslabel,itemLabel,amountLabel,priceLabel,totalPriceLabel,dateLabel].forEach{
            $0.snp.makeConstraints{
                $0.width.equalTo(65)
            }
        }
        
        mainStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        ocrImageView.snp.makeConstraints {
            $0.height.equalTo(428)
        }
        
        itemTextView.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        
        
    }
    
    func setInformation(data: UploadRes) {
        placetextField.text = data.name
        addresstextField.text = data.address
        itemTextView.text = appendString(data.itemName)
        amounttextField.text = appendString(data.itemCount)
        priceTextField.text = appendString(data.itemPrice)
        totalPricetextField.text = data.price
        dateTextField.text = data.date
    }
    
    func saveModel() -> SaveModel? {
        guard let itemString =  itemTextView.text else { return nil }
        var components = itemString.components(separatedBy: " / ")
        let itemArray = components.map { $0.trimmingCharacters(in: .whitespaces) }
        
        guard let priceString =  priceTextField.text else { return nil }
        components = priceString.components(separatedBy: " / ")
        let itemPriceArray = components.map { $0.trimmingCharacters(in: .whitespaces) }
        guard let date = dateTextField.text else { return nil }
        print(date)
        let saveInfo = SaveModel(date: date, address: addresstextField.text ?? "", memo: "", storeName: placetextField.text ?? "", firstName: itemArray[0], category: "", point: 3, item: itemArray, itemPrice: itemPriceArray, price: totalPricetextField.text ?? "")
        
        return saveInfo
    }
    
    
    func appendString(_ array: [String])->String{
        var string: String = array[0]
        for i in 1 ..< array.count {
            string.append(" / " + array[i])
        }
        return string
    }
    
    
}
