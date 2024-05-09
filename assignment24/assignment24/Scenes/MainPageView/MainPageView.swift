//
//  MainPageView.swift
//  assignment24
//
//  Created by Nuca on 09.05.24.
//

import UIKit

protocol MainPageViewDelegate {
    func getPhotosFor(index: Int) -> PhotoModel
    func didSelectPhoto(at: IndexPath)
}

class MainPageView: UIView, mainPageViewControllerDelegate {
    //MARK: - Properties
    var delegate: MainPageViewDelegate?
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Int, PhotoModel> = UICollectionViewDiffableDataSource<Int, PhotoModel>(collectionView: collectionView) {
        (collectionView: UICollectionView, indexPath: IndexPath, identifier: PhotoModel) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainPageViewCell", for: indexPath) as! MainPageViewCell
        cell.updateCell(with: identifier.urls.regular)
        return cell
    }
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "გალერეა"
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 100, height: 100),
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.backgroundColor = .clear
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
    func didLoad(with mainPageViewDelegate: MainPageViewDelegate, at index: IndexPath? = nil) {
        delegate = mainPageViewDelegate
        setUpUI()
        if let index {
            scrollToSelectedPhoto(at: index)
        }
    }
    
    //MARK: - functions
    func setUpUI(){
        backgroundColor = .systemBackground
        configureHeaderLabel()
        configureCollectionView()
    }
    
    func galleryDataUpdated(with photos: [PhotoModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(photos)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func scrollToSelectedPhoto(at index: IndexPath) {
        collectionView.scrollToItem(at: index, at: .top, animated: true)
    }
}

//MARK: - UICollectionViewDelegate
extension MainPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectPhoto(at: indexPath)
    }
}

//MARK: - Constraints
extension MainPageView {
    func configureCollectionView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        collectionView.register(MainPageViewCell.self, forCellWithReuseIdentifier: MainPageViewCell.identifier)
        collectionView.delegate = self
    }
    
    func configureHeaderLabel() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
