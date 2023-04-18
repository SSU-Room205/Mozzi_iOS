//
//  MypageViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/13.
//

import UIKit
import SnapKit


protocol DataBindProtocol: AnyObject {
    func dataBind(text: String)
}

class MypageViewController: UITabBarController {
    
    let mypageBackgroundImage = UIImage(named: "profileBackground")
    
    lazy var mypageBackgroundImageView = UIImageView(image: mypageBackgroundImage)
    lazy var profileView = ProfileView()
    lazy var wishLishView = WishListView()
    var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .green
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    private func setView(){
        setViewHierarchy()
        setLayout()
    }
    
    
    private func setViewHierarchy(){
        view.backgroundColor = .white
        view.addSubview(mypageBackgroundImageView)
        view.addSubview(profileView)
        view.addSubview(wishLishView)
        view.addSubview(collectionView)
        
    }
    
    private func setLayout(){
        mypageBackgroundImageView.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview()
        }
        profileView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        wishLishView.snp.makeConstraints{make in
            make.top.equalTo(profileView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(wishLishView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
}

extension MypageViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StampingImageCell.self, forCellWithReuseIdentifier: StampingImageCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StampingImageCell.identifier, for: indexPath) as? StampingImageCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .none
        cell.img.image = UIImage(named: "eatting")
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing : CGFloat = 10
        
        let myWidth : CGFloat = (collectionView.bounds.width - itemSpacing * 2) / 3
        
        
        return CGSize(width: myWidth, height: myWidth)
    }
}
