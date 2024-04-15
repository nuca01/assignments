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

//extension FruitsVC: FruitCellDelegate {
//    func removeFruit(from cell: FruitCell) {
//        if let indexPath = collectioView.indexPath(for: cell) {
//            fruits.remove(at: indexPath.row)
//            collectioView.reloadData()
//        }
//    }
//}
extension MainPageController: AddCardDelegate {
    func addCard(card: Card) {
        arrayOfCards.append(card)
        collectionView.reloadData()
    }
}
