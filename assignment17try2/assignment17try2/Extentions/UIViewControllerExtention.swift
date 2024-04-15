//
//  UIViewControllerExtention.swift
//  assignment17try2
//
//  Created by nuca on 15.04.24.
//

import UIKit
protocol ScaleSizeDelegate {
    func scaledSizeAccordingToScreenWidthOf(figmaSize: CGFloat) -> CGFloat
    func scaledSizeAccordingToScreenHeightOf(figmaSize: CGFloat) -> CGFloat
}
extension ScaleSizeDelegate {
    func scaledSizeAccordingToScreenWidthOf(figmaSize: CGFloat) -> CGFloat {
        (figmaSize / 375) * UIScreen.main.bounds.size.width
    }
    
    func scaledSizeAccordingToScreenHeightOf(figmaSize: CGFloat) -> CGFloat {
        (figmaSize / 812) * UIScreen.main.bounds.size.height
    }
}
extension UIViewController: ScaleSizeDelegate {
}
extension UICollectionViewCell:ScaleSizeDelegate{
    
}
