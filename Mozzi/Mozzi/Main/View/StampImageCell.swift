//
//  StampView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/13.
//

import UIKit
import SnapKit

class StampingImageCell : UICollectionViewCell {
    
    static let identifier = "cell"
    
    var img : UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.eattingStampImage
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetting() {
        self.backgroundColor = .gray
        addSubviews(img)
        img.contentMode = .scaleToFill
        img.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(0)
            $0.bottom.equalTo(-20)
        }
    }
}
