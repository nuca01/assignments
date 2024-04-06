//
//  ViewController.swift
//  assignment14
//
//  Created by nuca on 06.04.24.
//

import UIKit

extension UIFont {
    func withWeight(weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]
        
        traits[.weight] = weight
        
        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName
        
        let descriptor = UIFontDescriptor(fontAttributes: attributes)
        
        return UIFont(descriptor: descriptor, size: pointSize)
        
    }
}

extension UILabel {
    func setTextSpacingBy(value: Double) {
        if let text {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    func setLineHeight(lineHeight: Float) {
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

class ViewController: UIViewController {
    
    lazy var instructionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "მოგესალმებით!"
        label.font = UIFont(name: "systemFont", size: 24)
        label.setTextSpacingBy(value: 24 * 0.005)
        label.font = label.font.withWeight(weight: UIFont.Weight(400))
        label.setLineHeight(lineHeight: 33.68)
        label.textColor = UIColor(red: 0.063, green: 0.063, blue:0.063, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        label.font = UIFont(name: "Sylfaen", size: 14)
        label.font = label.font.withWeight(weight: UIFont.Weight(400))
        label.setLineHeight(lineHeight: 22.4)
        label.textColor = UIColor(red: 0, green: 0, blue:0, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(instructionsStackView)
        addStackViewConstraints(
            stackView: &instructionsStackView,
            width: 335,
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 110,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 20
        )
        instructionsStackView.addSubview(greetingLabel)
        addLabelConstraints(
            label: &greetingLabel,
            height: 34,
            width: 335,
            topAnchorSeparationInRespectTo: instructionsStackView.topAnchor,
            topAnchorSeparationConstant: 0,
            leadingAnchorSeparationInRespectTo: instructionsStackView.leadingAnchor,
            leadingAnchorSeparationConstant: 0
        )
        instructionsStackView.addSubview(instructionsLabel)
        addLabelConstraints(
            label: &instructionsLabel,
            width: 335,
            topAnchorSeparationInRespectTo: instructionsStackView.topAnchor,
            topAnchorSeparationConstant: 38,
            leadingAnchorSeparationInRespectTo: instructionsStackView.leadingAnchor,
            leadingAnchorSeparationConstant: 0
        )
    }

    func addLabelConstraints(
        label: inout UILabel,
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        topAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        topAnchorSeparationConstant: CGFloat? = nil,
        leadingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        leadingAnchorSeparationConstant: CGFloat? = nil
    ) {
        label.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        if height != nil {
            label.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if width != nil {
            label.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        //არ ვიცი if let ის შიგნით რამე თუ იცვლება და მძიმე როგორ მუშაობს
        if topAnchorSeparationConstant != nil && topAnchorSeparationInRespectTo != nil {
            label.topAnchor.constraint(
                equalTo: topAnchorSeparationInRespectTo!,
                constant: topAnchorSeparationConstant!
            ).isActive = true
        }
        if leadingAnchorSeparationConstant != nil && leadingAnchorSeparationInRespectTo != nil {
            label.leadingAnchor.constraint(
                equalTo: leadingAnchorSeparationInRespectTo!,
                constant: leadingAnchorSeparationConstant!
            ).isActive = true
        }
    }
    func addStackViewConstraints(
        stackView: inout UIStackView,
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        topAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        topAnchorSeparationConstant: CGFloat? = nil,
        leadingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        leadingAnchorSeparationConstant: CGFloat? = nil
    ) {
        stackView.frame = CGRect(x: 10, y: 10, width: 10, height: 10) //არ ვიცი რამდენად საჭიროა რადგან მაინც ქონსთრეინთები უნდა დავადო
        if height != nil {
            stackView.heightAnchor.constraint(equalToConstant: height!).isActive = true
        }
        if width != nil {
            stackView.widthAnchor.constraint(equalToConstant: width!).isActive = true
        }
        //არ ვიცი if let ის შიგნით რამე თუ იცვლება და მძიმე როგორ მუშაობს
        if topAnchorSeparationConstant != nil && topAnchorSeparationInRespectTo != nil {
            stackView.topAnchor.constraint(
                equalTo: topAnchorSeparationInRespectTo!,
                constant: topAnchorSeparationConstant!
            ).isActive = true
        }
        if leadingAnchorSeparationConstant != nil && leadingAnchorSeparationInRespectTo != nil {
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchorSeparationInRespectTo!,
                constant: leadingAnchorSeparationConstant!
            ).isActive = true
        }
    }

}

#Preview {
    UIViewController()
}
