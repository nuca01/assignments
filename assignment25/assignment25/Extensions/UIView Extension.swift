//
//  UIView Extension.swift
//  assignment25
//
//  Created by Nuca on 11.05.24.
//

import UIKit

extension UIView {
    func deactivateAllConstraints() {
        for constraint in self.constraints {
            constraint.isActive = false
        }
    }
}
