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
    
    var stampImages = StampImages.dummy(){
        didSet{
            self.mypageView.collectionView.reloadData()
        }
    }
    
    let mypageView = MypageView()
    
    override func loadView() {
        self.view = mypageView
        tabBar.isTranslucent = false
        tabBar.tintColor = .mozziMain
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mypageView.collectionView.dataSource = self
        mypageView.collectionView.delegate = self
        setView()
        presentModal()
    }
    
    private func setView(){
        setViewHierarchy()
        setLayout()
    }
    
    
    private func setViewHierarchy(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
    }
    
}

extension MypageViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1{
            return stampImages.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = WishListCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        }else if indexPath.section == 1 {
            let cell = StampingImageCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(stampImages[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: ProfileView.identifier,
                    for: indexPath
                ) as? ProfileView else {
                    return UICollectionReusableView()
                }
                return header
            } else if indexPath.section == 1 {
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: StampHeaderView.identifier,
                    for: indexPath
                ) as? StampHeaderView else {
                    return UICollectionReusableView()
                }
                return header
            }
            
        }else if kind == UICollectionView.elementKindSectionFooter {
            // Dequeue reusable supplementary view for footer
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LineView.identifier, // 보조 뷰의 식별자를 지정해야 함
                for: indexPath
            ) as? LineView else {
                return UICollectionReusableView()
            }
            
            return footer
        }
        
        return UICollectionReusableView()
    }
    
}

extension MypageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("셀 클릭됨")
        presentModal()
        
    }
    private func presentModal() {
        let detailViewController = StampViewController()
        
        let nav = UINavigationController(rootViewController: detailViewController)
        // 1
        nav.modalPresentationStyle = .pageSheet
        // 2
        if let sheet = nav.sheetPresentationController {
            // 3
            sheet.detents = [.medium(), .large()]
        }
        // 4
        present(nav, animated: true, completion: nil)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tabBar.tintColor = .mozziMain
    }
}
