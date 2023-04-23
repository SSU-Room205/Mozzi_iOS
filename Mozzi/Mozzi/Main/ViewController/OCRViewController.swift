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
        
        // 여기부터 서버 이미지 전송 코드
        let imageData = image.jpegData(compressionQuality: 1)!
        let formData = MultipartFormData()
        formData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: "https://port-0-mozzi-server-1maxx2algmvbeo4.sel3.cloudtype.app/upload").responseDecodable(of: UploadRes.self) { response in
            switch response.result {
            case .success(let uploadRes):
                
                // 서버에서 받아온 데이터를 화면에 표시
                let alert = UIAlertController(title: uploadRes.address, message: uploadRes.date + uploadRes.price, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        // ______________여기까지 _______________________________
    }
    
    private func setLayout(){
        importView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

struct UploadRes: Decodable {
    let address: String
    let price: String
    let date: String
}
