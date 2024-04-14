//
//  MainPageController+CollectionView.swift
//  assignment17try2
//
//  Created by nuca on 14.04.24.
//

import UIKit

extension MainPageController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        let currentCard = arrayOfCards[indexPath.row]
        cardCell.updateCell(with: currentCard)
        return cardCell
    }
}

//extension MainPageController: UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selected = fruits[indexPath.row]
//        print("navigate to \(selected) details")
//    }
//}

extension MainPageController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if indexPath.row < 9 {
//            return CGSize(width: 50, height: 50)
//        } else {
//            return CGSize(width: 100, height: 50)
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//    }
}
//
//#Preview {
//    FruitsVC()
//}

//extension FruitsVC: FruitCellDelegate {
//    func removeFruit(from cell: FruitCell) {
//        if let indexPath = collectioView.indexPath(for: cell) {
//            fruits.remove(at: indexPath.row)
//            collectioView.reloadData()
//        }
//    }
//}
