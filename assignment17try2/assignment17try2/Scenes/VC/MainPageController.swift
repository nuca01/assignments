//
//  MainPageController.swift
//  assignment17try2
//
//  Created by nuca on 14.04.24.
//

import UIKit
protocol AddCardDelegate {
    func addCard(card: Card)
}
class MainPageController: UIViewController {
    //MARK: - Properties
    let screenSize = UIScreen.main.bounds.size
    
    lazy var safeAreaInsents: UIEdgeInsets? = {
        var insents: UIEdgeInsets?
        if #available(iOS 11.0, *) {
            insents = view.safeAreaInsets
        }
        return insents
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        // collectionView დაშორებულია safearea-დან 20-ით ორივე მხრიდან და item-ებს შორის მანძილი 16-ია
        let realScreenSize = screenSize.width - safeAreaInsents!.left - safeAreaInsents!.right
        let itemWidthAccordingToScreenSize = (realScreenSize - 20 * 2 - 16) / 2
        collectionViewFlowLayout.itemSize = CGSize(
            width: itemWidthAccordingToScreenSize,
            height: scaledSizeAccordingToScreenHeightOf(figmaSize: 192)
        )
        collectionViewFlowLayout.minimumInteritemSpacing = 16
        collectionViewFlowLayout.minimumInteritemSpacing = 16
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 100, height: 100),
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var arrayOfCards = [
    Card(
        icon: "Red Icon",
        title: "Beka ras gverchi?",
        description: "ახლა გავხსენი დავალება ეს რააარიიი"
    ),
    Card(
        icon: "Blue Icon",
        title: "რამე სიმღერა მირჩიეთ",
        description: "დავალების კეთებისას ღამე ძაან მეძინება, ყავამ არ მიშველა"
    ),
    Card(
        icon: "Green Icon",
        title: "ფიგმამ თქვენც დაგტანჯათ?",
        description: "შევწუხდი დაბალი ხარისხით იწერს ყველას"
    ),
    Card(
        icon: "Yellow Icon",
        title: "მეტი ბედინა გვინდა",
        description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი"
    ),
    ]
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GradientBackground")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var addingButton: UIButton = {
        let button = UIButton()
        button.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.45, blue: 1, alpha: 1)
        button.addAction(UIAction(handler: { _ in
            self.pressed()
        }), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustAddButtonCorners()
        adjustFontSize()
    }
    
    //MARK: - Helper Methods
    func setUpUI(){
        addAndConstrainBackground()
        addAndConstrainAddButton()
        setupCollectionView()
    }
    
    func addAndConstrainBackground() {
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalToConstant: screenSize.height),
            backgroundImage.widthAnchor.constraint(equalToConstant: screenSize.width),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: addingButton.topAnchor, constant: -40)
        ])
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
    }
    
    func addAndConstrainAddButton() {
        view.addSubview(addingButton)
        NSLayoutConstraint.activate([
            addingButton.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenHeightOf(figmaSize: 48)),
            addingButton.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 290)),
            addingButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: scaledSizeAccordingToScreenHeightOf(figmaSize: 660)
            ),
            addingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func adjustAddButtonCorners() {
        addingButton.layer.cornerRadius = addingButton.bounds.height / 2
    }
    
    func adjustFontSize() {
        //ფიგმას ზომების მიხედვით ფონტის ზომა სიგანეზე 3.4ჯერ პატარაა
        let fontSizeaccordingToWidth = addingButton.bounds.height * (14 / 48)
        addingButton.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: fontSizeaccordingToWidth)
    }
    
    func scaledSizeAccordingToScreenWidthOf(figmaSize: CGFloat) -> CGFloat {
        (figmaSize / 375) * UIScreen.main.bounds.size.width
    }
    
    func scaledSizeAccordingToScreenHeightOf(figmaSize: CGFloat) -> CGFloat {
        (figmaSize / 812) * UIScreen.main.bounds.size.height
    }
    
    func pressed() {
        let nextViewController = AddNewCardViewController()
        nextViewController.delegate = self
        //უკან გამოსვლის საშუალება მივცეთ
        nextViewController.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

