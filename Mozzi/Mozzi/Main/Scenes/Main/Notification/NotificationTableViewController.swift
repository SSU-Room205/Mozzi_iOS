//
//  NotificationListViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/23.
//

import UIKit

class NotificationTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titles: [String] = [] //"어제보다 사용한 금액이 160% 증가했어요"
    var desciptions: [String] = [] //"어제 대비 320000원 사용 증가"
    let notificationTableView = UITableView(frame: .zero, style: .insetGrouped)
    let cellName = "NotificationListCell"
    let cellReuseIdentifier = "NotificationCell"
    let cellSpacing: CGFloat = 1
    let settingImage = UIImage(named: "setting")
    
    
    lazy var settingBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(tapButton(_:)))
        button.setBackgroundImage(settingImage, for: .normal, barMetrics: .default)
        return button
    }()
    
    
    let emptyNotificationImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.emptyNotificationImage
        return imageView
    }()
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 알림이 없어요!"
        label.font = .pretendardBold(ofSize: 22)
        return label
    }()
    
    let emptyLabel2: UILabel = {
        let label = UILabel()
        label.text = "알림설정을 통해 더 많은 알림을 받아보세요!"
        label.font = .pretendardMedium(ofSize: 14)
        return label
    }()
    
    lazy var emptyNotificationStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.addArrangeSubViews(emptyNotificationImageView,emptyLabel,emptyLabel2)
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    lazy var notificationCell = NotificationTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewHierarchy()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationTableViewCell
        cell.notiTitle.text = titles[indexPath.row]
        cell.notiDescription.text = desciptions[indexPath.row]
        return cell
    }
    
    
    private func setLayout(){
        
        notificationTableView.snp.makeConstraints{
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func setViewHierarchy(){
        self.navigationItem.title = "알림 목록"
        self.navigationItem.setRightBarButton(settingBarButton, animated: true)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.pretendardBold(ofSize: 16)]
        self.tabBarController?.tabBar.isHidden = true
        
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        
        notificationTableView.backgroundColor = .white
        notificationTableView.tintColor = .mozziDark
        
        if titles.isEmpty {
            setEmptyView()
        }
        else{
            attribute()
            view.addSubview(notificationTableView)
            setLayout()
            
        }
    }
    
    private func setEmptyView(){
        view.addSubview(emptyNotificationStackView)
        view.backgroundColor = .white
        emptyNotificationStackView.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        emptyNotificationImageView.snp.makeConstraints{
            $0.size.equalTo(108)
        }
    }
    
    private func attribute(){
        notificationTableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "cell" )
    }
    
    @objc func tapButton(_ sender: UIBarButtonItem){
        
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
