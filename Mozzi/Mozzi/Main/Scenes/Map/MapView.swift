//
//  MapView.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/04.
//

import UIKit
import SnapKit

class MapView: UIView {
    
    let subViewImage = UIImage(named: "back")
    
    lazy var topAreaView = UIImageView()
    lazy var SearchView = UIImageView()
    lazy var SearchTextField = UITextField()
    lazy var SearchButton = UIButton()
    lazy var SocialButton = UIBarButtonItem()
    lazy var searchBar = UISearchBar()
    lazy var view = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        let searchBarImage = UIImage(named: "searchBar")
        let areaImage = UIImage(named: "topArea")
        let socialImage = UIImage(named: "social")?.withRenderingMode(.alwaysOriginal)
        
        view.addSubview(topAreaView)
        
        
        topAreaView.image = areaImage
        topAreaView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(-5)
            make.width.equalToSuperview()
        }
        
        SocialButton.image = socialImage
    //    self.navigationItem.rightBarButtonItem = SocialButton
       
        searchBar.placeholder = "검색어를 입력해주세요."
        searchBar.backgroundImage = searchBarImage
      //  self.navigationItem.titleView = searchBar
        
        topAreaView.addSubview(SearchView)
        
    }
    
    private func setPlaceListView() {
        print("modal init")
        let placeListViewController = PlaceListViewController()
        if let sheet = placeListViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
          }
        //present(placeListViewController, animated: true)
        print("modal init")
    }

}
