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
    let profileJong: profile = .init(name: "JongHyun", profileImage: Images.profileJong!, job: "Actor")
    let profileHee: profile = .init(name: "희", profileImage: Images.profileRabbit!, job: "iOS개발자")
    let profileHam: profile = .init(name: "햄", profileImage: Images.profileCat!, job: "먹방유튜버")
    lazy var addProfileImage = self.profileHam.profileImage
    lazy var name: String = self.profileHam.name
    lazy var job: String = self.profileHam.job
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        imageView.makeCornerRound(radius: 17.5)
        imageView.image = profileHam.profileImage
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 14)
        label.text = profileHam.name
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardThin(ofSize: 10)
        
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
    func setDate(date: String) {
        dateLabel.text = date
    }
    
}
