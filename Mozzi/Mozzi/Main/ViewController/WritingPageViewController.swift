//
//  WritingPageViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/17.
//

import UIKit


class WritingPageViewController: UIViewController {
    
    let picker = UIImagePickerController()
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    
    private let writingPageView = WritingPageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
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
    
    func updateInfomation(item: String, place: String,address:String, price: String, date: String){
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
