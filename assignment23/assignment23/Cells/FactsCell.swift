//
//  FactsCell.swift
//  assignment23
//
//  Created by nuca on 03.05.24.
//

import UIKit
class FactsCell: UITableViewCell {
    //MARK: - Properties
    static let identifier = "FactsCell"
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Initilizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setUpUI(){
        addAndConfigureTitleLabel()
    }
    
    func addAndConfigureTitleLabel() {
        contentView.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func updateCell(with text: String) {
        mainLabel.text = text
    }
}
