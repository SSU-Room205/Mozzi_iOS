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
        label.font = .pretendardBold(ofSize: 16)
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardThin(ofSize: 14)
        return label
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(stampImageView, titleLabel, subLabel)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
            $0.width.equalTo(150)
        }
        stampImageView.snp.makeConstraints {
            $0.size.equalTo(100)
        }
    }
}
