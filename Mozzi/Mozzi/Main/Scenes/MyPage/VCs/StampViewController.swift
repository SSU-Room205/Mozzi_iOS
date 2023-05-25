//
//  StampView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/23.
//

import UIKit

class StampViewController: UIViewController {
    private let stampImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardBold(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardThin(ofSize: 16)
        label.numberOfLines = 4
        return label
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(stampImageView, titleLabel, subLabel)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mozziBackGround
        setUI()
    }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        
        view.addSubview(stackView)
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(230)
        }
        stampImageView.snp.makeConstraints {
            $0.size.equalTo(100)
        }
    }
    
    func setInfo(image: UIImage, title: String, description: String){
        stampImageView.image = image
        titleLabel.text = title
        subLabel.text = description
    }
}
