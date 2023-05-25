//
//  WritingPageViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/17.
//

import UIKit
import Alamofire
import Kingfisher


class WritingPageViewController: UIViewController {
    
    var dummyData = Consum1.dummy()
    var data: UploadRes?
    var addData: AddRequest?
    var sendImage: UIImage?
    var memo: String?
    
    let picker = UIImagePickerController()
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    
    private lazy var writingPageView = WritingPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        writingPageView.textView.delegate = self
        setUI()
        addTarget()
    }
    
    
    func addTarget(){
        
        writingPageView.addPhotoButton.addTarget(self, action: #selector(photoButtonDidTap), for: .touchUpInside)
        picker.delegate = self
        
        writingPageView.placeImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
        
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        
    }
    
    func updateInfomation(data: UploadRes){
        
        writingPageView.itemTitleTextField.text = data.itemName[0]
        writingPageView.placeTextField.text = data.name
        writingPageView.addressTextField.text = data.address
        writingPageView.priceTextField.text = data.itemPrice[0]
        self.navigationController?.title = data.date
        
        
        addData = AddRequest(date: data.date, item: data.itemName, address: data.address, price: data.price, memo: writingPageView.textView.text, storeName: data.name, itemPrice: data.itemPrice, category: writingPageView.category ?? "", point: 3)
    }
    
    @objc func photoButtonDidTap(){
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func viewTapped(){
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    @objc func nextButtonDidTap() {
        print("클릭됨")
        memo = writingPageView.textView.text
        postInfomation()
        if let image = writingPageView.placeImageView.image {
            uploadImage(image, user: "imageUpload3")
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
private extension WritingPageViewController {
    func setUI(){
        
        view.backgroundColor = .white
        view.addSubview(writingPageView)
        
        writingPageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(nextButtonDidTap))
        navigationController?.navigationBar.tintColor = .mozziMain
        
    }
    
    private func postInfomation(){
        guard let addData = addData else { return }
        let param: Parameters = [
            "storeName" : addData.storeName,
            "address" : addData.address,
            "price" : addData.price,
            "item" : addData.item,
            "itemPrice" : addData.itemPrice,
            "date" : addData.date,
            "category" : writingPageView.category,
            "point" : addData.point,
            "memo" : memo
        ]
        
        PostService.shared.postService(with: param, from: Config.baseURL+"add3", isTokenUse: false) {
            (data: Post?, error) in
            guard let data = data else {
                print("error: \(String(describing: error?.debugDescription))")
                return
            }
            print(data)
        }
    }
}
extension WritingPageViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //guard let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage else { return }
        guard let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        writingPageView.setPlaceImage(image: image)
        sendImage = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension WritingPageViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .label
        textView.text = nil
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "기억에 남는 순간을 기록으로 남겨 보세요 :)"
            textView.textColor = .placeholderText
        }
    }
}

extension WritingPageViewController {
    func uploadImage(_ image: UIImage, user: String) {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("Failed to convert image to JPEG data")
            return
        }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: "\(Config.baseURL)\(user)").responseString { response in
            switch response.result {
            case .success(let value):
                print("Image upload success:", value)
                // Handle success response
                    
            case .failure(let error):
                print("Image upload failure:", error.localizedDescription)
                // Handle failure response
            }
        }
    }

    struct ImageUploadResponse: Decodable {
        // Define your response structure here
        // Match the structure with the actual server response
    }

}
