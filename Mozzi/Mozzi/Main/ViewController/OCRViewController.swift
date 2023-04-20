//
//  OCRViewController.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/18.
//

import UIKit
import SnapKit

class OCRViewController: UIViewController {
  
    private let loadingView = LoadingView()
    private let importView = OCRImportView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(importView)
        setLayout()
    }
    
    func updateImage(_ image: UIImage){
        importView.ocrImageView.image = image
    }
    
    private func setLayout(){
        importView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
