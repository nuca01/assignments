//
//  UILabelExtention.swift
//  assignment17try2
//
//  Created by nuca on 13.04.24.
//
import UIKit

extension UILabel {
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
