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
        label.textColor = UIColor.label
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
        ensureSpaceBetweenCells()
        configureBorder()
    }
    
    //MARK: - Methods
    func setUpUI() {
        backgroundColor = .clear
        addAndConstrainFlagImage()
        constrainChevronImage()
        addAndConstrainLabelAndChevronStackview()
    }
    
    func updateCell(with country: Country) {
        setTitleText(using: country)
        setFlagImage(using: country)
    }
}
