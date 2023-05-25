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
    
    
    let stampInfoList: [StampInfo] = [StampInfo(title: "햄과의 만남", description: "오늘부터 햄과 다양한 기록을 남기로했어요"),
                                      StampInfo(title: "식사의 즐거움", description: "다양한 식사을 즐길줄 아는 당신 \n벌써 20곳의 식당을 방문했어요!"),
                                      StampInfo(title: "21세기 탐험가", description: "새로운 장소 방문하기"),
                                      StampInfo(title: "나는야 셀럽", description: "나의 기록이 점점 주목받고 있어요"),
                                      StampInfo(title: "탕진의 즐거움", description: "두손은 무겁게! 지갑은 가볍게!"),
                                      StampInfo(title: "커피 한잔의 여유", description: "갈땐 가더라도 커피한잔은 괜찮잖아?"),
                                      StampInfo(title: "소 확 행", description: "소심하지만 확고한 나만의 행복채우기"),
                                      StampInfo(title: "한박자 쉬고", description: "우리 햄도 연차 낼 줄 압니다"),
                                      StampInfo(title: "햄(마)스터", description: "이제는 기록이 습관화가 된 당신")]
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mypageView.collectionView.dataSource = self
        mypageView.collectionView.delegate = self
        setView()
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
            if indexPath.item == 1{
                cell.cellConfigure(image: Images.wishListImage1!, title: "닌텐도 스위치")
            } else if indexPath.item == 2 {
                cell.cellConfigure(image: Images.wishListImage2!, title: "트랙패드 2세대")
            }
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
        if indexPath.section == 1{
            presentModal(index: indexPath.item)
        }
        
    }
    private func presentModal(index: Int) {
        let detailViewController = StampViewController()
        detailViewController.setInfo(image: stampImages[index].image, title: stampInfoList[index].title, description: stampInfoList[index].description)
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
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        let yOffset = scrollView.contentOffset.y
    //        let threshold: CGFloat = 100 // 스크롤 임계값 (선택적으로 조정 가능)
    //
    //        if yOffset > threshold {
    //            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
    //            navigationController?.navigationBar.shadowImage = nil
    //            tabBar.backgroundImage = nil
    //            tabBar.shadowImage = nil
    //        } else {
    //            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    //            navigationController?.navigationBar.shadowImage = UIImage()
    //            tabBar.backgroundImage = UIImage()
    //            tabBar.shadowImage = UIImage()
    //        }
    //    }
}
