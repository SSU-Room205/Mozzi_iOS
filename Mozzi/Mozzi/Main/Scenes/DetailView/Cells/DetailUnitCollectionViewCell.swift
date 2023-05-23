//
//  DetailUnitCollectionViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/17.
//

import UIKit

class DetailUnitCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 14)
        label.numberOfLines = 30
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(detailLabel)
    }
    
    private func setConstraints() {
        detailLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(_ info: DataResponseElement){
        detailLabel.text = info.memo
    }
}
