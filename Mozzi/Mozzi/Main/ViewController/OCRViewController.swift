//
//  OCRViewController.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/04/18.
//

import UIKit
import SnapKit
import Alamofire


class OCRViewController: UIViewController {
    
    private var data: UploadRes?
  
    private let loadingView = LoadingView()
    private let importView = OCRImportView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setUI()
    }
    
    func updateImage(_ image: UIImage){
        
        importView.ocrImageView.image = image
        
        // 여기부터 서버 이미지 전송 코드
        let imageData = image.jpegData(compressionQuality: 1)!
        let formData = MultipartFormData()
        formData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: "https://port-0-server-mozzi-e9btb72blgv08nbr.sel3.cloudtype.app/upload").responseDecodable(of: UploadRes.self) { response in
            switch response.result {
            case .success(let uploadRes):
                self.data = UploadRes(name: uploadRes.name, price: uploadRes.price, date: uploadRes.date, address: uploadRes.address, itemName: uploadRes.itemName, itemCount: uploadRes.itemCount, itemPrice: uploadRes.itemPrice)
                self.loadingView.isHidden = true
                print(uploadRes.itemName)
                self.setInfomation()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        // ______________여기까지 _______________________________
    }
    
    private func setUI(){
        view.backgroundColor = .white
        view.addSubviews(loadingView, importView)
        view.bringSubviewToFront(loadingView)
        navigationController?.navigationBar.tintColor = .mozziDark
        navigationItem.backButtonTitle = "이전"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(nextButtonDidTap))
        setLayout()
    }
    
    private func setLayout(){
        
        loadingView.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        importView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setInfomation(){
        guard let data else { return }
        importView.setInformation(data.name, data.address, data.itemName, data.itemCount, data.itemPrice, data.price, data.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func nextButtonDidTap() {
        let nextVC = WritingPageViewController()
        print("클릭됨")
        guard let data else { return }
        nextVC.updateInfomation(item: data.itemName[0] , place: data.name, address: data.address, price: data.itemPrice[0], date: data.date)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
