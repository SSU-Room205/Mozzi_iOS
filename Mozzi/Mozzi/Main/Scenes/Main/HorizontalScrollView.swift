//
//  HorizontalScrollView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/14.
//


import Foundation
import UIKit
import SnapKit



class HorizontalScrollView: BaseScrollView {
    
    private let dummy = Consum1.dummy()
    var data: DataResponse?
    var countData = 0
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        view.spacing = 30
        return view
    }()
    
    
    override func configure() {
        super.configure()
        showsHorizontalScrollIndicator = false
        bounces = false
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview() /// 이 값이 없으면 scroll 안되는 것 주의
            make.height.equalTo(80)
        }
    }
    func bind(_ date: String) {
        super.bind()
        guard let data = data else { return }
        data.forEach { data in
            if(data.date == date ){
                for i in 0..<data.item.count{
                    let view = DaliyUseView()
                    stackView.addArrangedSubview(view)
                    view.configureCell(item: data.item[i], price: data.itemPrice[i])
                    view.setConstraints()
                    self.countData += 1
                }
            }
        }
        
        func removeAllView() {
            stackView.clearSubViews()
        }
        
        func bind() {
            super.bind()
            data.forEach { dataElement in
                let view = DaliyUseView()
                stackView.addArrangedSubview(view)
                view.configureCell(item: dataElement.item[0], price: dataElement.itemPrice[0])
            }
            
        }
        
    }
}
