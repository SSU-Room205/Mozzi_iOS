//
//  ProfileView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/17.
//

import UIKit
import SnapKit

final class ProfileHeaderView: UICollectionReusableView {
    
    static let identifier = "profileHeaderView"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        imageView.makeCornerRound(radius: 17.5)
        imageView.image = Images.profileRabbit
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 14)
        label.text = "김나비"
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardThin(ofSize: 10)
        label.text = "2023년 3월 14일 3:45 PM"
        return label
    }()
    
    private lazy var labelStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(nameLabel,dateLabel)
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(profileImageView,labelStackView)
        stackView.spacing = 10
        return stackView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy() {
        addSubviews(mainStackView)
    }
    
    func setConstraints() {
        mainStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(35)
        }
    }
    
    
}
