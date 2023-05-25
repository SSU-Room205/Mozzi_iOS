//
//  DetailViewController.swift
//  Mozzi
//
//  Created by 지희의 MAC on 2023/05/17.
//
import UIKit
import SnapKit

class DetailViewController: UIViewController {
    let detailView = DetailView()
    var data: DataResponseElement?
    var geocode: Geocode?
    var image: UIImage?
    
    override func loadView() {
        self.view = detailView
        detailView.collectionView.dataSource = self
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.tintColor = .mozziMain
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = data else { return UICollectionViewCell() }
        if indexPath.section == 0 {
            let cell = InfoUnitCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            guard let image else { return cell }
            cell.cellConfigure(info: data, image: image)
            
            return cell
            
        } else if indexPath.section == 1 {
            let cell = MapUnitCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            guard let geocode = geocode else { return cell }
            cell.moveToPosition(geocode: geocode)
            return cell
        } else if indexPath.section == 2 {
            let cell = DetailUnitCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(data)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ProfileHeaderView.identifier,
                for: indexPath
            ) as? ProfileHeaderView else {
                return UICollectionReusableView()
            }
            guard let date = data?.date else { return header }
            header.setDate(date: date)
            return header
        } else if kind == UICollectionView.elementKindSectionFooter {
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

