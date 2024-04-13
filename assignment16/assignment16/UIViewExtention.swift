import UIKit

extension UIView {
    func addViewConstraints(
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        topAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        topAnchorSeparationConstant: CGFloat? = nil,
        bottomAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        bottomAnchorSeparationConstant: CGFloat? = nil,
        leadingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        leadingAnchorSeparationConstant: CGFloat? = nil,
        trailingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        trailingAnchorSeparationConstant: CGFloat? = nil,
        centerXAnchorEqualTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        centerYAnchorEqualTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil
    ) {
        frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        if let height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let topAnchorSeparationConstant, let topAnchorSeparationInRespectTo {
            topAnchor.constraint(
                equalTo: topAnchorSeparationInRespectTo,
                constant: topAnchorSeparationConstant
            ).isActive = true
        }
        if let bottomAnchorSeparationConstant, let bottomAnchorSeparationInRespectTo {
            bottomAnchor.constraint(
                equalTo: bottomAnchorSeparationInRespectTo,
                constant: bottomAnchorSeparationConstant
            ).isActive = true
        }
        if let leadingAnchorSeparationConstant, let leadingAnchorSeparationInRespectTo {
            leadingAnchor.constraint(
                equalTo: leadingAnchorSeparationInRespectTo,
                constant: leadingAnchorSeparationConstant
            ).isActive = true
        }
        if let trailingAnchorSeparationConstant, let trailingAnchorSeparationInRespectTo {
            trailingAnchor.constraint(equalTo: trailingAnchorSeparationInRespectTo, constant: trailingAnchorSeparationConstant).isActive = true
        }
        if let centerXAnchorEqualTo {
            centerXAnchor.constraint(equalTo: centerXAnchorEqualTo).isActive = true
        }
        if let centerYAnchorEqualTo {
            centerYAnchor.constraint(equalTo: centerYAnchorEqualTo).isActive = true
        }
    }
}
