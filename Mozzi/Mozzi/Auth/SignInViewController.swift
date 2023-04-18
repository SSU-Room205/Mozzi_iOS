//
//  LoginViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    lazy var idField = UITextField()
    lazy var passwordField = UITextField()
    lazy var inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()
    lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var loginImageView = UIImageView()
    lazy var logoImageView = UIImageView()
    lazy var loginButton = UIButton()
    lazy var signUpButton = UIButton()
    lazy var findPwButton = UIButton()
    lazy var helpButton = UIButton()
    let backgroundImage = UIImage(named: "loginBackground")
    let logoImage = UIImage(named: "logo_w")
    let idPlaceholder = "이메일을 입력해주세요"
    let passwordPlaceholder = "비밀번호를 입력해주세요"
    
    let signUpViewController = SignUpViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure(){
        
        
        view.backgroundColor = .white
        view.addSubview(loginImageView)
        view.addSubview(inputStackView)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        view.addSubview(bottomStackView)
        
        loginImageView.addSubview(logoImageView)
        
        loginImageView.image = backgroundImage
        loginImageView.snp.makeConstraints{make in
            make.top.width.equalToSuperview()
        }
        
        logoImageView.image = logoImage
        logoImageView.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(160)
        }
        
        inputStackView.addArrangeSubViews(idField,passwordField)
        
        inputStackView.snp.makeConstraints { make in
            make.top.equalTo(loginImageView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(35)
            make.height.equalTo(120)
            make.top.equalTo(loginImageView.snp.bottom).offset(30)
        }
        

        idField.placeholder = idPlaceholder
        idField.keyboardType = .emailAddress
        idField.autocapitalizationType = .none


        passwordField.placeholder = passwordPlaceholder
        passwordField.isSecureTextEntry = true
        passwordField.autocapitalizationType = .none

        
        loginButton.backgroundColor = UIColor(named: "Dark Color")
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.snp.makeConstraints{make in
            make.width.equalTo(312)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(inputStackView.snp.bottom).offset(47)
        }
//
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(.secondaryLabel, for: .normal)
        signUpButton.snp.makeConstraints{make in
            make.width.equalTo(312)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(10)
        }
        
        
        bottomStackView.addArrangeSubViews(findPwButton,helpButton)
        
        bottomStackView.snp.makeConstraints{ make in
            make.bottom.equalTo(view.snp.bottom).offset(-34)
            make.left.equalToSuperview().offset(34)
            make.width.equalTo(277)
            make.height.equalTo(19)
        }
        
        findPwButton.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        findPwButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        helpButton.setTitle("도움이 필요하신가요?", for: .normal)
        helpButton.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        findPwButton.setTitleColor(.secondaryLabel, for: .normal)
        helpButton.setTitleColor(.secondaryLabel, for: .normal)

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
