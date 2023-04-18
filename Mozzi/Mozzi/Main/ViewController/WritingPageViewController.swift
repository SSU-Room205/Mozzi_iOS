//
//  WritingPageViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/17.
//

import UIKit


class WritingPageViewController: UIViewController {
    
    private let writingPageView = WritingPageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}
private extension WritingPageViewController {
    func setUI(){
        
        view.backgroundColor = .white
        view.addSubview(writingPageView)
        writingPageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
