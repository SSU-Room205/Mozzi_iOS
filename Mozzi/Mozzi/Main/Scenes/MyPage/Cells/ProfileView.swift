//
//  profileView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/31.
//

import UIKit
import SnapKit

class ProfileView: UICollectionReusableView {
    
    static let identifier = "ProfileView"
    let profileJong: profile = .init(name: "JongHyun", profileImage: Images.profileJong!, job: "Actor")
    let profileHee: profile = .init(name: "희", profileImage: Images.profileRabbit!, job: "iOS개발자")
    let profileHam: profile = .init(name: "햄", profileImage: Images.profileCat!, job: "먹방유튜버")
    lazy var addProfileImage = self.profileHam.profileImage
    lazy var name: String = self.profileHam.name
    lazy var job: String = self.profileHam.job
    
    let mypageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .mozziMain
        view.makeCornerRound(radius: 530)
        view.makeBorder(width: 3, color: .white)
        view.makeShadow(radius: 0, offset: CGSize(width: 0, height: 3), opacity: 1)
        view.layer.shadowColor = UIColor.mozziMain.cgColor
        return view
    }()
    

    
    private lazy var mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 14
        stackView.addArrangeSubViews(profileimageView,infoStackView)
        return stackView
    }()
   
    private lazy var infoStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.addArrangeSubViews(nameLabel,jobLabel)
        return stackView
    }()
    
    private let wishLabel: UILabel = {
        let label = UILabel()
        label.text = "위시리스트"
        label.font = .pretendardBold(ofSize: 20)
        label.textColor = .mozziDark
        return label
    }()
    
    private lazy var profileimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = self.addProfileImage
        imageView.makeCornerRound(radius: 50)
        imageView.makeBorder(width: 2, color: .white)
        imageView.makeShadow(radius: 0, offset: CGSize(width: 0, height: 4), opacity: 1)
        imageView.layer.shadowColor = UIColor.mozziDark.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    lazy var profileAddButton: UIButton = {
        let button = UIButton()
        button.setImage(addProfileImage, for: .normal)
        button.makeCornerRound(radius: 50)
        button.makeBorder(width: 2, color: .mozziMain)
        button.makeShadow(radius: 0, offset: CGSizeMake(2, 0), opacity: 1)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.textAlignment = .center
        label.font = .pretendardMedium(ofSize: 16)
        return label
    }()
    
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.text = job
        label.textAlignment = .center
        label.font = .pretendardThin(ofSize: 14)
        return label
    }()
    
    override func layoutSubviews() {
        setLayout()
    }
    
    private func setLayout(){
        self.addSubviews(mypageBackgroundView,mainStackView,wishLabel)
        
        mypageBackgroundView.snp.makeConstraints{
            $0.size.equalTo(1060)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(-900)
        }
        
        mainStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        profileimageView.snp.makeConstraints{
            $0.size.equalTo(100)
        }
        wishLabel.snp.makeConstraints {
            $0.top.equalTo(mypageBackgroundView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(18)
        }
        
    }

}
