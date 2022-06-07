//
//  HomeCollectionViewDataSource.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/06/02.
//

import UIKit

final class HomeCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { 2 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 1 : 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroImageCell.identifier, for: indexPath) as? HeroImageCell else { return UICollectionViewCell() }
            
                return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedTravelDestinationCell.identifier, for: indexPath) as? RecommendedTravelDestinationCell else { return UICollectionViewCell() }
            
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView else { return UICollectionReusableView() }
        return headerView
    }
}
