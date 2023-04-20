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
    
    func addTarget(){
        writingPageView.addPhotoButton.addTarget(self, action: #selector(photoButtonDidTap), for: .touchUpInside)
    }
    
    @objc func photoButtonDidTap(){
        print("성공!✅✅✅✅✅✅✅")
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
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
