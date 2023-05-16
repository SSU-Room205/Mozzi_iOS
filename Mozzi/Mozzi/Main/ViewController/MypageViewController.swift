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
    
//    lazy var mainScrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//       return scrollView
//    }()
    let mypageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .mozziMain
        view.makeCornerRound(radius: 530)
        view.makeBorder(width: 3, color: .white)
        view.makeShadow(radius: 0, offset: CGSize(width: 3, height: 3), opacity: 1)
        view.layer.shadowColor = UIColor.mozziMain.cgColor
        return view
    }()
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var stampImages = StampImages.dummy(){
        didSet{
            self.stampcollectionView.reloadData()
        }
    }
    lazy var profileView = ProfileView()
    lazy var wishLishView = WishListView()
    var stampcollectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 98, height: 98)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setView()
    }
    
    private func setView(){
        setViewHierarchy()
        setLayout()
    }
    
    
    private func setViewHierarchy(){
        view.backgroundColor = .white
        view.addSubviews(mypageBackgroundView,profileView,wishLishView,stampcollectionView)
//        view.addSubview(mainScrollView)
//        mainScrollView.addSubviews(mypageBackgroundView,profileView,wishLishView,stampcollectionView)
//        mainScrollView.backgroundColor = .blue
        
    }
    
    private func setLayout(){
//        mypageBackgroundImageView.snp.makeConstraints{
//            $0.top.leading.trailing.equalToSuperview()
//        }
//        mainScrollView.snp.makeConstraints{
//            $0.edges.equalToSuperview()
//        }
        mypageBackgroundView.snp.makeConstraints{
            $0.size.equalTo(1060)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(-850)
        }
        profileView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
        }
        wishLishView.snp.makeConstraints{
            $0.top.equalTo(profileView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(220)
        }
        stampcollectionView.snp.makeConstraints{
            $0.top.equalTo(wishLishView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
}

extension MypageViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    func configureCollectionView() {
        stampcollectionView.delegate = self
        stampcollectionView.dataSource = self
        stampcollectionView.register(StampingImageCell.self, forCellWithReuseIdentifier: StampingImageCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stampImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = stampcollectionView.dequeueReusableCell(withReuseIdentifier: StampingImageCell.identifier, for: indexPath) as? StampingImageCell else {
            
            return UICollectionViewCell()
        }
        cell.configureCell(stampImages[indexPath.item])
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 98, height: 98)
//    }
}
