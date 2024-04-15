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
        let addedByMe = indexPath.row > 3
        cardCell.updateCell(with: currentCard)
        return cardCell
    }
}

extension MainPageController: AddCardDelegate {
    func addCard(card: Card) {
        arrayOfCards.append(card)
        collectionView.reloadData()
    }
}
