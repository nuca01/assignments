//
//  Cell.swift
//  assignment24
//
//  Created by Nuca on 09.05.24.
//

import UIKit
import ImageService
class Cell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "Cell"
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setUpUI(){
        addAndConfigureImage()
    }
    
    func addAndConfigureImage() {
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func updateCell(with url: String) {
        fetchImage(with: url)
    }
    
    func fetchImage(with url: String) {
        ImageService.imageService.loadImageFromURL(url){ image in
            if let image = image {
                self.image.image = image
            } else {
                self.backgroundColor = .black
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
}
