//
//  View GenerateView Functions.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

extension DetailsPageView {
    
    func genetarteSemiTitleLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor.label
        label.text = text
        return label
    }
    
    func generateInformationLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.label
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func generateHorizontalInformationStackView(with explanation: String, and value: String) -> UIStackView {
        //ლეიბლების დაგენერირება
        let explanationLabel = generateInformationLabel(with: explanation)
        let valueLabel = generateInformationLabel(with: value)
        //მივაწეპოთ კიდეებზე
        explanationLabel.textAlignment = .left
        valueLabel.textAlignment = .right
        //განვუსაზღვროთ სიგანეები
        constrain(explanationLabel: explanationLabel, valueLabel: valueLabel)
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [explanationLabel,
         valueLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
    
    func generateTitleAndDescriptionStackview(with title: UILabel, and description: UIView) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        [title,
         description
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
    
    func generateMapsImage(with imageName: String, first: Bool) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.label.cgColor
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        var tapGesture: UITapGestureRecognizer
        if first {
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(firstImageTapped))
        } else {
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(secondImageTapped))
        }
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        return imageView
    }
}
