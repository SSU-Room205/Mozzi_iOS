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
    
    
    
    lazy var emptyLabel = UILabel()
    lazy var emptyLabel2 = UILabel()
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
        
        self.tabBarController?.tabBar.isHidden = true
        
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        
        notificationTableView.backgroundColor = .white
        notificationTableView.tintColor = UIColor(named: "Dark Color")
        if titles.isEmpty {
            view.addSubview(emptyLabel)
            view.addSubview(emptyLabel2)
            view.backgroundColor = .white
            emptyLabel.text = "아직 알림이 없어요"
            emptyLabel.font = UIFont.boldSystemFont(ofSize: 16).withSize(22)
            emptyLabel.snp.makeConstraints{ make in
                make.top.equalToSuperview().offset(125)
                make.centerX.equalToSuperview()
            }
            emptyLabel2.text = "알림설정을 통해 더 많은 알림을 받아보세요!"
            emptyLabel2.snp.makeConstraints{ make in
                make.top.equalTo(emptyLabel.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
            }
        }
        else{
            attribute()
            view.addSubview(notificationTableView)
            setLayout()
            
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
