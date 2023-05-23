//
//  PlaceListViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/03.
//
import UIKit
import SnapKit

class PlaceListViewController: UIViewController {
    
    
    //  let dataArray = MockParser.load(Consum.self, from: "Consum")
    var tableViewCount: Int = 0
    
    private lazy var placeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlaceListTableViewCell.self, forCellReuseIdentifier: PlaceListTableViewCell.identifier)
        tableView.rowHeight = 130
        return tableView
    }()
    
    private var placeListTableViewCell = PlaceListTableViewCell()
  //  private(set) lazy var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure(){
        setViewHierarchy()
        setLayout()
    }
    
    private func setViewHierarchy(){
        view.backgroundColor = .white
        //  printContent(dataArray)
        view.addSubview(placeTableView)
    }
    
    private func setLayout(){
        placeTableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    

    
}
