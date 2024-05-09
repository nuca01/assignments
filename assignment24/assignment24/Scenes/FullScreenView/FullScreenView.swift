//
//  FullScreenView.swift
//  assignment24
//
//  Created by Nuca on 09.05.24.
//

import UIKit

protocol FullScreenViewDelegate {
    func getPhotosFor(index: Int) -> PhotoModel
}
class FullScreenView: UIView, FullScreenViewControllerDelegate {
    
    //MARK: - Properties
    private var delegate: FullScreenViewDelegate?
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Int, PhotoModel> = UICollectionViewDiffableDataSource<Int, PhotoModel>(collectionView: collectionView) {
        (collectionView: UICollectionView, indexPath: IndexPath, identifier: PhotoModel) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainPageViewCell", for: indexPath) as! MainPageViewCell
        cell.updateCell(with: identifier.urls.regular)
        return cell
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        collectionViewFlowLayout.minimumLineSpacing = 0
//        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 100, height: 100),
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.backgroundColor = .clear
//        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycles
    func didLoad(with fullScreenViewDelegate: FullScreenViewDelegate, at index: IndexPath? = nil){
        delegate = fullScreenViewDelegate
        setUpUI()
        if let index {
            self.scrollToSelectedPhoto(at: index)
        }
    }
    
    //MARK: - function
    func setUpUI(){
        backgroundColor = .systemBackground
        configureCollectionView()
    }
    
    func galleryDataUpdated(with photos: [PhotoModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(photos)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureCollectionView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        collectionView.register(MainPageViewCell.self, forCellWithReuseIdentifier: MainPageViewCell.identifier)
    }
    
    func scrollToSelectedPhoto(at index: IndexPath) {
        collectionView.layoutIfNeeded()
        self.collectionView.scrollToItem(at: index, at: .left, animated: true)
    }
}
