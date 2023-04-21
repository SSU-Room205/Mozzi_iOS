//
//  OCRImportView.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/19.
//

import Foundation

final class OCRImportView: BaseView{
    
    lazy var ocrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()
    


    func setViewHierarchy() {
        addSubviews(ocrImageView)
    }
    
    func setConstraints() {
        ocrImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(428)
        }
        
    }
    
    
}
