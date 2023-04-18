//
//  profileView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/31.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    let addProfileImage = UIImage(named: "addProfile")
    var name: String = "이름"
    var job: String = "직업"
    
    private let mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 14
        
        return stackView
    }()
   
    private let infoStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var profileAddButton: UIButton = {
        let button = UIButton()
        button.setImage(addProfileImage, for: .normal)
        return button
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.text = job
        label.textAlignment = .center
        return label
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame:CGRect.zero)
        setLayout()
        
    }
    
    private func setLayout(){
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(profileAddButton)
        mainStackView.addArrangedSubview(infoStackView)
        
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(jobLabel)
        
        mainStackView.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(20)
        }
        
        profileAddButton.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.height.equalTo(100)
        }
        
    }

}
