//
//  MainViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit
import SnapKit
import FSCalendar
import Alamofire
import SDWebImage


class MainViewController: UITabBarController {
    
    var selectedDate: Date = Date()
    
    let notificaiotnImage = UIImage(named: "notification")
    lazy var horizontalScrollView: HorizontalScrollView = {
        let view = HorizontalScrollView()
        return view
    }()
    
    lazy var camera: UIImagePickerController = {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        return camera
    }()
    
    let picker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        return picker
    }()
    
    let backBarButtonItem = UIBarButtonItem(title: "이전", style: .plain, target: MainViewController.self, action: nil)
    
    let fsCalendar = FSCalendar(frame: .zero)
    
    lazy var profileButton: UIButton = UIButton()
    lazy var recentLabel: UILabel = UILabel()
    lazy var notificationButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(tapButton(_:)))
        button.setBackgroundImage(notificaiotnImage, for: .normal, barMetrics: .default)
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.plusButtonImage, for: .normal)
        button.setImage(Images.plusButtonTapImage, for: .selected)
        button.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.cameraButtonImage, for: .normal)
        button.addTarget(self, action: #selector(cameraButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var fileButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.fileButtonImage, for: .normal)
        button.addTarget(self, action: #selector(fileButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var writeButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.writeButtonImage, for: .normal)
        button.addTarget(self, action: #selector(writeButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.addArrangeSubViews(cameraButton,fileButton,writeButton)
        stackView.axis = .vertical
        stackView.isHidden = true
        return stackView
    }()
    
    lazy var floatingDimView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.alpha = 0
        view.isHidden = true
        
        self.view.insertSubview(view, belowSubview: self.addButton)
        
        return view
    }()
    
    lazy var buttons: [UIButton] = [self.cameraButton, self.fileButton, self.writeButton]
    var buttonIsHidden: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camera.delegate = self
        picker.delegate = self
        view.backgroundColor = .white
        configure()
        insertDataSource()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .none
        addButton.isSelected = false
        buttonIsHidden = true
        floatingDimView.alpha = 0
        buttonStack.isHidden = buttonIsHidden
    }
    
    private var flag: Bool = false
    @objc func addButtonDidTap(_ sender: UIButton){
        //        let image = self.buttonIsHidden ? Images.plusButtonImage : Images.plusButtonTapImage
        
        //        sender.setImage(image, for: .normal)
        sender.isSelected = !sender.isSelected
        UIView.animate(withDuration: 0.5) {
            if self.buttonIsHidden {
                sender.transform = CGAffineTransform(rotationAngle: .pi - (.pi / 2))
            } else {
                sender.transform = .identity
            }
        }
        buttonIsHidden = !buttonIsHidden
        
        //
        //        let roatation = buttonIsHidden ? CGAffineTransform(rotationAngle: .pi - (.pi / 2)) : CGAffineTransform.identity
        
        
        if buttonIsHidden {
            buttons.reversed().forEach { button in
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            }) { (_) in
                self.floatingDimView.isHidden = true
            }
            
        } else{
            buttonStack.isHidden = buttonIsHidden
            buttons.forEach { [weak self] button in
                button.isHidden = false
                button.alpha = 0
                UIView.animate(withDuration: 0.3) {
                    button.alpha = 1
                    self?.view.layoutIfNeeded()
                }
            }
            floatingDimView.isHidden = false
            
            UIView.animate(withDuration: 0.5) {
                self.floatingDimView.alpha = 1
            }
            
        }
        
    }
    
    private func configure() {
        
        setCalendar()
        self.navigationItem.setRightBarButton(notificationButton, animated: false)
        backBarButtonItem.tintColor = darkColor
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        
        view.addSubviews(recentLabel,fsCalendar,horizontalScrollView,addButton,buttonStack)
        
        fsCalendar.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(125)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(420)
        }
        
        recentLabel.text = "Daily Use"
        recentLabel.snp.makeConstraints{ make in
            make.top.equalTo(fsCalendar.snp.bottom).offset(25)
            make.leading.equalTo(30)
        }
        
        horizontalScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(recentLabel.snp.bottom).offset(20)
        }
        addButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(130)
        }
        
        buttonStack.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(addButton.snp.top).offset(-20)
        }
        
    }
    
    private func insertDataSource() {
        horizontalScrollView.dataSource = Mocks.getDataSource()
        
    }
    
    @objc func tapButton(_ button: UIBarButtonItem){
        let notificationVC = NotificationTableViewController()
        self.navigationController?.pushViewController(notificationVC, animated: true)
    }
    
    @objc func cameraButtonDidTap(){
        present(camera, animated: true, completion: nil)
    }
    
    @objc func fileButtonDidTap(){
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @objc func writeButtonDidTap(){
        let nextVC = WritingPageViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        print("버튼 클릭됨")
    }
}


extension MainViewController: FSCalendarDelegate,FSCalendarDataSource{
    private func setCalendar(){
        
        fsCalendar.delegate = self
        fsCalendar.dataSource = self
        
        fsCalendar.backgroundColor = .white
        fsCalendar.layer.cornerRadius = 30
        
        fsCalendar.appearance.headerTitleColor = .black
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0.0
        fsCalendar.appearance.weekdayTextColor = UIColor(named: "main Color")
        fsCalendar.appearance.selectionColor = .mozziMain
        
        
        fsCalendar.layer.borderWidth = 3
        fsCalendar.layer.borderColor = UIColor(named: "main Color")?.cgColor
        fsCalendar.layer.shadowOffset = CGSize(width: 0, height: 10)
        fsCalendar.layer.shadowOpacity = 0.3
        fsCalendar.layer.shadowRadius = 0
        fsCalendar.layer.shadowColor = UIColor(named: "Dark Color")?.cgColor
        
        
        
        fsCalendar.locale = Locale(identifier: "ko_KR")
        
        // 상단 요일을 한글로 변경
        fsCalendar.calendarWeekdayView.weekdayLabels[0].text = "일"
        fsCalendar.calendarWeekdayView.weekdayLabels[1].text = "월"
        fsCalendar.calendarWeekdayView.weekdayLabels[2].text = "화"
        fsCalendar.calendarWeekdayView.weekdayLabels[3].text = "수"
        fsCalendar.calendarWeekdayView.weekdayLabels[4].text = "목"
        fsCalendar.calendarWeekdayView.weekdayLabels[5].text = "금"
        fsCalendar.calendarWeekdayView.weekdayLabels[6].text = "토"
    }
    
    func
    calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
        
    }
}

extension MainViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //guard let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage else { return }
        guard let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
    
        picker.dismiss(animated: true, completion: nil)
        let nextVC = OCRViewController()
        nextVC.updateImage(image)
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
