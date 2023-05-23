//
//  NotificationTableViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/27.
//

import UIKit
import SnapKit

class NotificationTableViewCell: UITableViewCell {
    
    let normalIconImage = UIImage(named: "normal")
    let increaseIconImage = UIImage(named: "increase")
    let decreaseIconImage = UIImage(named: "decrease")
    let reviewIconImage = UIImage(named: "review")
    

    
    lazy var iconImageView: UIImageView = UIImageView(image: normalIconImage)
    lazy var notiTitle = UILabel()
    lazy var notiDescription = UILabel()
    lazy var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setViewHierarchy()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

    private func setViewHierarchy(){
        
        self.addSubviews(notiTitle,notiDescription,dateLabel)
        
        
        iconImageView.snp.makeConstraints{make in
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(54)
        }
        
        notiTitle.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        notiTitle.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
        }
        
        notiDescription.font = UIFont.systemFont(ofSize: 14)
        notiDescription.snp.makeConstraints{make in
            make.top.equalTo(notiTitle.snp.bottom).offset(5)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
        }
        
        dateLabel.text = "32분전"
        
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.textColor = .systemGray3
        dateLabel.snp.makeConstraints{ make in
            make.top.equalTo(notiDescription.snp.bottom).offset(5)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            
        }
        
    }
    

}
