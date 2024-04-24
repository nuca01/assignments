//
//  CountryCellConstraints.swift
//  assignment21
//
//  Created by nuca on 25.04.24.
//

import UIKit

extension CountryCell {
    
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
}
