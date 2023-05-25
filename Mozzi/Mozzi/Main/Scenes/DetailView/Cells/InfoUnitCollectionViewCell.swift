//
//  infoUnitCollectionViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/17.
//

import UIKit

final class InfoUnitCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private lazy var infoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(mainImageView,labelView,itemTitleLabel,locationLabel,priceLabel,remainItemLabel)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.makeCornerRound(radius: 10)
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 10)
        label.textColor = .white
        return label
    }()
    private let labelView: UIView = {
       let view = UIView()
        view.backgroundColor = .mozziMain
        view.makeCornerRound(radius: 10)
        return view
    }()
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 
        label.font = .pretendardBold(ofSize: 20)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 16)
        return label
    }()
    
    private let remainItemLabel: UILabel = {
       let label = UILabel()
        label.font = .pretendardThin(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(infoStackView)
        labelView.addSubview(categoryLabel)
    }
    
    private func setConstraints() {
        infoStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        labelView.snp.makeConstraints{
            $0.width.equalTo(32)
            $0.height.equalTo(20)
        }
        
        categoryLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.width.equalTo(340)
            $0.height.equalTo(240)
            $0.centerX.equalToSuperview()
        }
    }
    
    func cellConfigure(info: DataResponseElement, image: UIImage) {
        categoryLabel.text = info.category
        
        
        itemTitleLabel.text = info.item.first ?? ""
        let remainItems = info.item.dropFirst().joined(separator: " ")
        remainItemLabel.text = remainItems.isEmpty ? " " : "함께 구매한 항목: " + remainItems
        locationLabel.text = info.address
        priceLabel.text = "￦ \(info.price)원"
        mainImageView.image = image
    }
    
}
