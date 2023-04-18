//
//  PlaceListView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/07.


import UIKit
import SnapKit

class PlaceListView: UIView {
    private var viewTranslation: CGPoint = .init(x: 0, y: 0)
    private var viewVelocity: CGPoint = .init(x: 0, y: 0)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        addGesture()
    }
    
    private func addGesture(){
        print("addGesture")
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didMove(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    @objc private func didMove(_ sender: UIPanGestureRecognizer) {
       
        viewTranslation = sender.translation(in: self)
        viewVelocity = sender.translation(in: self)
        print(self.viewVelocity)
        switch sender.state {
        case .changed:
            if viewTranslation.y > 0 {
                self.transform = CGAffineTransform(translationX: 0, y: viewTranslation.y)
            }
        case .ended:
            if viewTranslation.y < self.frame.height / 2 {
                UIView.animate(withDuration: 0.5, delay: 0) {
                    self.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            } else {
                UIView.animate(withDuration: 0.5, delay: 0) {
                    self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
                }
            }
        default:
            break
        }
    }
    
    
    
    private func setLayout() {
        print("setLayout")
        self.backgroundColor = .white
        self.addSubview(handleView)
        
        
        
        
        handleView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(30)
            $0.height.equalTo(5)
        }
        handleView.layer.cornerRadius = 5
        handleView.clipsToBounds = true
    }
    
    private var handleView: UIView =  {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    
}


