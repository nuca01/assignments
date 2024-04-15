//
//  CardCell.swift
//  assignment17try2
//
//  Created by nuca on 14.04.24.
//

import UIKit

protocol CardCellDelegate {
    func removeCard(from cell: CardCell)
}

class CardCell: UICollectionViewCell {
 //MARK: - Properties
    static let identifier = "CardCell"
    var delegate: CardCellDelegate?
    
    lazy var titleAndDescriptionTextView: UITextView = {
        let textView =  UITextView()
        textView.textAlignment = .left
        textView.font = UIFont(
            name: "FiraGO-Regular",
            size: scaledSizeAccordingToScreenWidthOf(figmaSize: 16)
        )
        textView.isEditable = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        return textView
    }()
    
//    lazy var removeButton: UIButton = {
//       let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("წაშალე", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//        button.titleLabel?.font = UIFont(
//            name: "FiraGO-Regular",
//            size: scaledSizeAccordingToScreenWidthOf(figmaSize: 10)
//        )
//        button.backgroundColor = .purple
//        return button
//    }()
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [iconImage,
         titleAndDescriptionTextView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
//MARK: - Initilizators
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Helper Methods
    func setupUI() {
        configureBackgroundAndShape()
        addAndConstrainIconImage()
        constrainTitleTextView()
        addAndConstrainStackView()
//        removeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
//        
//        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
    }
    
    func configureBackgroundAndShape() {
        //თითქმის გამჭირვალე
        backgroundColor = UIColor(white: 1, alpha: 0.05)
        layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10
    }
    
    func addAndConstrainIconImage() {
        addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 40)),
            iconImage.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 40))
        ])
    }
    
    func constrainTitleTextView() {
        //dimension-ები ფიგმადან
        let iconSize = scaledSizeAccordingToScreenWidthOf(figmaSize: 40)
        let distanceFromEdges: CGFloat = 20 * 2
        let distanceFromIcon: CGFloat = 10
        let scaledHeightAccordingToCellHeight = contentView.bounds.height - distanceFromEdges - distanceFromIcon - iconSize
        NSLayoutConstraint.activate([
            titleAndDescriptionTextView.heightAnchor.constraint(equalToConstant: scaledHeightAccordingToCellHeight),
            titleAndDescriptionTextView.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 116))
        ])
    }
    
    func addAndConstrainStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func scaledSizeAccordingToScreenWidthOf(figmaSize: CGFloat) -> CGFloat {
        figmaSize / 375 * UIScreen.main.bounds.size.width
    }
    
    func updateCell(with card: Card) {
        iconImage.image = UIImage(named: card.icon!)
        editTextViewWith(title: card.title!, description: card.description!)
    }
    
    func editTextViewWith(title: String, description: String) {
        let attributedString = NSMutableAttributedString()
        
        //სათაურის ტექსტის მახასიათებლები
        let firstText = createAttributedString(
            with: "\(title)\n",
            figmaSize: 16,
            color: UIColor.white
        )
        //სათაურის ტექსტის ჩამატება სტრინგში თავისი მახასიათებლებით
        attributedString.append(firstText)
        
        //აღწერის ტექსტის მახასიათებლები
        let secondText = createAttributedString(
            with: (description),
            figmaSize: 10,
            color: UIColor(red: 0.36, green: 0.38, blue: 0.44, alpha: 1)
        )
        //აღწერის ტექსტის ჩამატება სტრინგში თავისი მახასიათებლებით
        attributedString.append(secondText)
        
        //მიტყეპებული რომ არ იყოს ერთმანეთზე (ფიგმაში დაშორებულია)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            //დაწყებული სათაურის ბოლო ასოდან, დახასიათების ბოლომდე spacing არის 2
            range: NSRange(location: firstText.length, length: secondText.length)
        )
        
        //textView-ს ტექსტისთვის ჩვენი attributedString ცვლადის მინიჭება
        titleAndDescriptionTextView.attributedText = attributedString
    }
    
    func createAttributedString(
        with text: String,
        figmaSize: CGFloat,
        color: UIColor
    ) -> NSAttributedString{
        //სათაურის ტექსტის მახასიათებლები
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont(
                    name: "FiraGO-Medium",
                    size: scaledSizeAccordingToScreenWidthOf(figmaSize: figmaSize)
                )!,
                NSAttributedString.Key.foregroundColor: color]
        )
    }
//    @objc func removeButtonTapped() {
//        delegate?.removeFruit(from: self)
//    }
}
