//
//  MainViewController.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/02/25.
//

import UIKit
import SnapKit
import FSCalendar



class MainViewController: UITabBarController,FSCalendarDelegate,FSCalendarDataSource {
    
    lazy var horizontalScrollView: HorizontalScrollView = {
        let view = HorizontalScrollView()
        return view
    }()
    fileprivate weak var fsCalendar: FSCalendar!
    lazy var profileButton: UIButton = UIButton()
    lazy var alarmButton: UIButton = UIButton()
    lazy var recentLabel: UILabel = UILabel()
    
    lazy var tabView = UIStackView()
    lazy var mapButton = UIButton()
    lazy var homeButton = UIButton()
    lazy var proflieButton = UIButton()
    

    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
            self.view = view
    }

      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .white
          configure()
          insertDataSource()
         
      }

      private func configure() {
          let fsCalendar = FSCalendar(frame: CGRect(x: 30, y: 150, width: 340, height: 400))
          let image = UIImage(named: "notification")
          
          fsCalendar.dataSource = self
          fsCalendar.delegate = self
          
          fsCalendar.appearance.headerTitleColor = .black
          fsCalendar.appearance.headerMinimumDissolvedAlpha = 0.0
          fsCalendar.appearance.weekdayTextColor = UIColor(named: "main Color")
          

          fsCalendar.layer.borderWidth = 3
          fsCalendar.layer.borderColor = UIColor(named: "main Color")?.cgColor
          fsCalendar.layer.shadowOffset = CGSize(width: 0, height: 10)
          fsCalendar.layer.shadowOpacity = 0.3
          fsCalendar.layer.shadowRadius = 0
          fsCalendar.layer.shadowColor = UIColor(named: "Dark Color")?.cgColor
          

          
          view.addSubview(alarmButton)
          view.addSubview(recentLabel)
          view.addSubview(fsCalendar)
          view.addSubview(horizontalScrollView)
          
          
          
          self.fsCalendar = fsCalendar
          fsCalendar.backgroundColor = .white
          fsCalendar.layer.cornerRadius = 30
          
          fsCalendar.snp.makeConstraints{ make in
              make.centerX.equalToSuperview()
              make.top.equalToSuperview().offset(120)
              make.width.equalTo(340)
              make.height.equalTo(400)
          }
          
          
          alarmButton.setImage(image, for: .normal)
          alarmButton.snp.makeConstraints{ make in
              make.top.equalToSuperview().offset(50)
              make.right.equalToSuperview().offset(-35)
              make.width.height.equalTo(40)
              
          }
          
          recentLabel.text = "Daily Use"
          recentLabel.snp.makeConstraints{ make in
              make.top.equalTo(fsCalendar.snp.bottom).offset(25)
              make.left.equalTo(30)
          }
          
          horizontalScrollView.snp.makeConstraints { make in
              make.width.equalToSuperview()
              make.height.equalTo(100)
              make.top.equalTo(recentLabel.snp.bottom).offset(10)
          }

      }

      private func insertDataSource() {
          horizontalScrollView.dataSource = Mocks.getDataSource()
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
