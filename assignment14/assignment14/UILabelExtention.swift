//
//  LabelExtention.swift
//  assignment14
//
//  Created by nuca on 07.04.24.
//

import UIKit

extension UILabel {
    func setTextSpacingBy(value: Double) {
        if let text {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    func setLineHeight(lineHeight: Double) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = CGFloat(lineHeight)
        paragraphStyle.maximumLineHeight = CGFloat(lineHeight)
        if let text {
            self.attributedText = NSAttributedString(
                string: text,
                attributes: [
                    .baselineOffset : 0,
                    .paragraphStyle : paragraphStyle
                ]
            )
        }
    }
}
