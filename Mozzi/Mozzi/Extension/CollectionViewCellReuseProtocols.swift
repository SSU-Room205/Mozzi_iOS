//
//  CollectionViewCellReuseProtocols.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/05/17.
//

import UIKit

protocol CollectionViewCellReuseProtocol where Self: UICollectionViewCell {
    static func register(collectionView: UICollectionView)
    static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self
    static var reuseIdentifier: String { get }
}

extension CollectionViewCellReuseProtocol {
    static func register(collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    static func dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? Self else { fatalError()}
        return cell
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
