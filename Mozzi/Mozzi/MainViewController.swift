//
//  MainViewController.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/02/25.
//

import UIKit
import SnapKit
import FSCalendar



class MainViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource {
    
    lazy var horizontalScrollView: HorizontalScrollView = {
        let view = HorizontalScrollView()
        return view
    }()
    fileprivate weak var fsCalendar: FSCalendar!
    lazy var profileButton: UIButton = UIButton()
    lazy var hambugerButton: UIButton = UIButton()
    lazy var recentLabel: UILabel = UILabel()
        
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
            self.view = view
    }

      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = UIColor(named: "darkgreen")
          configure()
          insertDataSource()
         
      }

      private func configure() {
          let fsCalendar = FSCalendar(frame: CGRect(x: 30, y: 150, width: 340, height: 400))
          
          fsCalendar.dataSource = self
          fsCalendar.delegate = self
          view.addSubview(profileButton)
          view.addSubview(hambugerButton)
          view.addSubview(recentLabel)
          view.addSubview(fsCalendar)
          view.addSubview(horizontalScrollView)
          
          self.fsCalendar = fsCalendar
          fsCalendar.backgroundColor = .white
          fsCalendar.layer.cornerRadius = 30
          
          profileButton.setImage(UIImage(named: "profile")!, for: .normal)
          profileButton.snp.makeConstraints{ make in
              make.top.equalToSuperview().offset(60)
              make.right.equalToSuperview().offset(-25)
              make.width.height.equalTo(60)
          }
          
          hambugerButton.setImage(UIImage(named: "hambuger"), for: .normal)
          hambugerButton.snp.makeConstraints{ make in
              make.top.equalToSuperview().offset(75)
              make.left.equalToSuperview().offset(35)
              make.width.height.equalTo(40)
              
          }
          
          recentLabel.text = "최근 구매한 내용"
          recentLabel.snp.makeConstraints{ make in
              make.top.equalTo(fsCalendar.snp.bottom).offset(15)
              make.left.equalTo(30)
          }
          
          horizontalScrollView.snp.makeConstraints { make in
              make.width.equalToSuperview()
              make.height.equalTo(100)
              make.top.equalTo(fsCalendar.snp.bottom).offset(40)
              //make.top.equalTo(fsCalendar.snp.bottom).offset(10)
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
