//
//  PlaceListView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/07.


import UIKit
import SnapKit

class PlaceListView: UIView {
    private var viewTranslation: CGPoint = .init(x: 0, y: 0)
    private var viewVelocity: CGPoint = .init(x: 0, y: 0)
    
    var tableViewCount: Int = 0
    
    lazy var placeTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(PlaceListTableViewCell.self, forCellReuseIdentifier: PlaceListTableViewCell.identifier)
        tableView.rowHeight = 130
        return tableView
    }()
    
    private var placeListTableViewCell = PlaceListTableViewCell()
    
    private let netWorkErrorImageView = UIImageView(image: UIImage(systemName: "antenna.radiowaves.left.and.right.slash"))
    private let netWorkErrorLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    private lazy var netWorkErrorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangeSubViews(netWorkErrorImageView,netWorkErrorLabel)
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    
    private(set) lazy var refreshControl = UIRefreshControl()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        addGesture()
    }
    
    private func addGesture(){
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didMove(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    @objc private func didMove(_ sender: UIPanGestureRecognizer) {
       
        viewTranslation = sender.translation(in: self)
        viewVelocity = sender.translation(in: self)
       // print(self.viewVelocity)
        switch sender.state {
        case .changed:
            if viewTranslation.y > 0 {
                self.transform = CGAffineTransform(translationX: 0, y: viewTranslation.y)
            }
        case .ended:
            if viewTranslation.y < self.frame.height / 2 {
                UIView.animate(withDuration: 0.5, delay: 0) {
                    self.transform = CGAffineTransform(translationX: 0, y: 0)
                }
            } else {
                UIView.animate(withDuration: 0.5, delay: 0) {
                    self.transform = CGAffineTransform(translationX: 0, y: self.frame.height * 0.7)
                }
            }
        default:
            break
        }
    }
    
    
    
    private func setLayout() {
        self.backgroundColor = .white
        self.makeCornerRound(radius: 20)
        self.makeShadow(radius: 20, offset: CGSize(width: 2, height: 2), opacity: 0.5)
        
        // dint 생성
        self.addSubview(handleView)
        handleView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(30)
            $0.height.equalTo(5)
        }
        handleView.layer.cornerRadius = 5
        handleView.clipsToBounds = true
        
        self.addSubview(placeTableView)
        
        placeTableView.snp.makeConstraints{
            $0.top.equalTo(handleView.snp.bottom).offset(20)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    // dint
    private var handleView: UIView =  {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    func setNetWorkErrorView() {
        print("뷰 생성")
        self.addSubviews(netWorkErrorStackView)
        netWorkErrorStackView.bringSubviewToFront(placeTableView)
        netWorkErrorStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
        }
    }
    
}


