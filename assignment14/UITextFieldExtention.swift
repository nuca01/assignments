//
//  UITextFieldExtention.swift
//  assignment14
//
//  Created by nuca on 08.04.24.
//

import UIKit
extension UITextField {
    func isEmail() -> Bool {
        return self.text?.isEmail() ?? false
    }
}
