//
//  loadingView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/18.
//

import UIKit
import SnapKit

class LoadingView: BaseView {
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "영수증 읽는 중"
        return label
    }()
    
    private let loadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.loadingHamImage
        return imageView
    }()
    
    private lazy var loadingStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(loadingImageView,loadingLabel)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    
    
    func setViewHierarchy() {
        self.addSubviews(loadingStackView)
    }
    
    func setConstraints() {
        loadingImageView.snp.makeConstraints{
            $0.height.width.equalTo(200)
        }
        
        loadingStackView.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
}
