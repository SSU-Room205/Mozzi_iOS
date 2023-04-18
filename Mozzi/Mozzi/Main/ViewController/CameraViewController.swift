//
//  CameraViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/15.
//

import UIKit
import SnapKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    lazy var camera: UIImagePickerController = {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        return camera
    }()
    
    let myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        camera.delegate = self

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           
           if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
               myImageView.image = image
           }

           picker.dismiss(animated: true, completion: nil)
       }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    
    
    func setUI(){
        view.addSubviews(myImageView)
        myImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            
        }
    }
}
