//
//  LayoutSubViewsHelperMethods.swift
//  assignment21
//
//  Created by nuca on 25.04.24.
//

import UIKit

extension CountryCell {
    
    func ensureSpaceBetweenCells() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    func configureBorder() {
        contentView.layer.cornerRadius = contentView.bounds.height / 2
        contentView.layer.borderColor = UIColor.label.cgColor
        contentView.layer.borderWidth = 1
    }
}
