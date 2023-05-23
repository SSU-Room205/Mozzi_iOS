//
//  WritingPageViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/17.
//

import UIKit
import Alamofire


class WritingPageViewController: UIViewController {
    
    var dummyData = Consum1.dummy()
    var data: Consum1 = Consum1(image: Images.photoAddButtonImage!, name: "", itemName: "", address: "", price: "", date: "", category: "", point: 0, note: "")


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
    
    func updateInfomation(image:UIImage, item: String, place: String,address:String, price: String, date: String){
        data = Consum1(image: image, name: place, itemName: item, address: address, price: price, date: date, category: "", point: 0, note: "")
        writingPageView.itemTitleTextField.text = item
        writingPageView.placeTextField.text = place
        writingPageView.addressTextField.text = address
        writingPageView.priceTextField.text = price
        self.navigationController?.title = date
        
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
        dummyData.append(data)
        print(dummyData)
        
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
        let param: Parameters = [
            "storeName" : "진푸중화요리",
            "address" : "서울 동작구 상도로 372-3 지하1층",
            "price" : 18000,
            "item" : "",
            "itemPrice" : "14000 / 4000",
            "date" : "2023-05-19",
            "category" : "식사",
            "point" : 5,
            "memo" : "마라샹궈 마라향 강하고 너무 맛있어요. 숭실대 찐 맛집이야 여기"
        ]
        PostService.shared.postService(with: param, from: Config.baseURL+"add2", isTokenUse: false) {
            (data: AddRequest?, error) in
            
        }
    }
}
extension WritingPageViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //guard let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage else { return }
        guard let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        writingPageView.setPlaceImage(image: image)
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
