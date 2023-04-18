//
//  SignInView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/22.
//

import UIKit

class SignInView: UIView {
    
    lazy var idField = UITextField()
    lazy var passwordField = UITextField()
    
    lazy var loginImageView = UIImageView()
    lazy var logoImageView = UIImageView()
    lazy var loginButton = UIButton()
    lazy var signinButton = UIButton()
    let backgroundImage = UIImage(named: "loginBackground")
    let logoImage = UIImage(named: "logo_w")
    let idPlaceholder = "이메일을 입력해주세요"
    let passwordPlaceholder = "비밀번호를 입력해주세요"
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
