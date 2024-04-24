//
//  CountryCell.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

class CountryCell: UITableViewCell {
    //MARK: - Properties
    static let identifier = "CountriesCell"
    
    lazy var flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chevron 1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var labelAndChevronStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel,
         chevronImage
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    //MARK: - Initilizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //დაშორება სელებს შოორის
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        configureBorder()
    }
    
    //MARK: - Helper Methods
    func setUpUI() {
        addAndConstrainFlagImage()
        constrainChevronImage()
        addAndConstrainLabelAndChevronStackview()
    }
    
    func configureBorder() {
        contentView.layer.cornerRadius = contentView.bounds.height / 2
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
    }
    
    func addAndConstrainFlagImage() {
        contentView.addSubview(flagImage)
        NSLayoutConstraint.activate([
            flagImage.widthAnchor.constraint(equalToConstant: 30),
            flagImage.heightAnchor.constraint(equalToConstant: 20),
            flagImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            flagImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func constrainTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    func constrainChevronImage() {
        NSLayoutConstraint.activate([
            chevronImage.widthAnchor.constraint(equalToConstant: 11),
            chevronImage.heightAnchor.constraint(equalToConstant: 10.14)
        ])
    }
    
    func addAndConstrainLabelAndChevronStackview(){
        contentView.addSubview(labelAndChevronStackview)
        NSLayoutConstraint.activate([
            labelAndChevronStackview.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: flagImage.trailingAnchor, multiplier: 2),
            labelAndChevronStackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelAndChevronStackview.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setTitleText(using country: Country) {
        if let name = country.name{
            if let common = name.common {
                titleLabel.text = common
            } else {
                titleLabel.text = "Unknown"
            }
        } else {
            titleLabel.text = "Unknown"
        }
    }
    
    func setFlagImage(using country: Country) {
        setTitleText(using: country)
        if let flags = country.flags{
            if let png = flags.png {
                ImageService.imageService.loadImageFromURL(png){ image in
                    if let image = image {
                        self.flagImage.image = image
                    } else {
                        self.flagImage.image = UIImage(named: "question mark")
                    }
                }
            } else {
                self.flagImage.image = UIImage(named: "question mark")
            }
            if let alt = flags.alt {
                flagImage.accessibilityLabel = alt
            } else {
                flagImage.accessibilityLabel = "info unavailable"
            }
        }
    }
    
    func updateCell(with country: Country) {
        setTitleText(using: country)
        setFlagImage(using: country)
    }
}
