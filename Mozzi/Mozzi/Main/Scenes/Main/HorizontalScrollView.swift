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
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        view.spacing = 30
        return view
    }()
    
    var dataSource: [Consum]? {
        didSet { bind() }
    }
    
    
    
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
    func bind(_ date: String){
        super.bind()
        //       let VC = MainViewController()
        dummy.forEach { data in
            
            if(data.date == date ){
                let view = DaliyUseView()
                stackView.addArrangedSubview(view)
                view.configure(data)
                view.snp.makeConstraints{
                    $0.width.equalTo(150)
                    $0.height.equalTo(72)
                }
            }
            //          view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(VC.viewTapped)))
            
        }
        
        func removeAllView() {
            stackView.clearSubViews()
        }
        
        func bind() {
            super.bind()
            //       let VC = MainViewController()
            dummy.forEach { data in
                let view = DaliyUseView()
                stackView.addArrangedSubview(view)
                view.configure(data)
                //          view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(VC.viewTapped)))
                view.snp.makeConstraints{
                    $0.width.equalTo(150)
                    $0.height.equalTo(72)
                }
            }
            
            
            
        }
    }
}
