//
//  AddButton.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/31.
//

import UIKit

let addImage = UIImage(named: "add")

class AddButton: UIButton {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame:CGRect.zero)
        self.setImage(addImage, for: .normal)
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 10
    }

}
