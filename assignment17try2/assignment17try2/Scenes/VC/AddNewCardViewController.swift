//
//  AddNewCardViewController.swift
//  assignment17try2
//
//  Created by nuca on 15.04.24.
//

import UIKit

class AddNewCardViewController: UIViewController {
    //MARK: - Properties
    let screenSize = UIScreen.main.bounds.size
    
    var delegate: AddCardDelegate?
    
    var card: Card = Card()
    
    lazy var titleLabel = getLabelWith(text: " სათაური")
    lazy var titleTextfield = getTextfieldWith(placeholder: "მაგ: პანიკა, დახმარება მჭირდება")
    lazy var titleStackView = getLabelTextFieldStackViewWith(label: titleLabel, textField: titleTextfield)
    
    lazy var descriptionLabel = getLabelWith(text: " აღწერა")
    lazy var descriptionTextfield = getTextfieldWith(placeholder: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ")
    lazy var descriptionStackView = getLabelTextFieldStackViewWith(label: descriptionLabel, textField: descriptionTextfield)
    
    lazy var iconSelectionLabel = getLabelWith(text: " აირჩიეთ აიქონი")
    
    lazy var redIcon = getButtonWith(image: "Red Icon")
    lazy var blueIcon = getButtonWith(image: "Blue Icon")
    lazy var greenIcon = getButtonWith(image: "Green Icon")
    lazy var yellowIcon = getButtonWith(image: "Yellow Icon")
    
    lazy var safeAreaInsents: UIEdgeInsets? = {
        var insents: UIEdgeInsets?
        if #available(iOS 11.0, *) {
            insents = view.safeAreaInsets
        }
        return insents
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GradientBackground")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var addingButton: UIButton = {
        let button = UIButton()
        button.setTitle("დამატება", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.6, blue: 0.06, alpha: 1)
        button.addAction(UIAction(handler: { _ in
            self.add()
        }), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var allTextFieldsWithLabelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            titleStackView,
            descriptionStackView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var iconsStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            redIcon,
            blueIcon,
            greenIcon,
            yellowIcon
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var iconsAndSelectionLabelStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            iconSelectionLabel,
            iconsStackview
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            allTextFieldsWithLabelsStackView,
            iconsAndSelectionLabelStackview
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustAddButtonCorners()
        adjustFontSizes()
    }
    
    //MARK: - Helper Methods
    func setUpUI(){
        addAndConstrainBackground()
        addAndConstrainAddButton()
        constrainTextFields()
        constrainLabels()
        constrainIconsStackView()
        constrainWholeStackView()
        constrainIcons()
    }
    
    func addAndConstrainBackground() {
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalToConstant: screenSize.height),
            backgroundImage.widthAnchor.constraint(equalToConstant: screenSize.width),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func addAndConstrainAddButton() {
        view.addSubview(addingButton)
        NSLayoutConstraint.activate([
            addingButton.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenHeightOf(figmaSize: 48)),
            addingButton.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 290)),
            addingButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: scaledSizeAccordingToScreenHeightOf(figmaSize: 660)
            ),
            addingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func constrainTextFields() {
        constrain(textField: titleTextfield)
        constrain(textField: descriptionTextfield)
    }
    
    func constrainLabels() {
        constrain(label: titleLabel)
        constrain(label: descriptionLabel)
        constrain(label: iconSelectionLabel)
    }
    
    func constrainIconsStackView(){
        NSLayoutConstraint.activate([
            iconsStackview.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 310))
        ])
    }
    func constrainWholeStackView() {
        view.addSubview(wholeStackView)
        NSLayoutConstraint.activate([
            wholeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wholeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
        ])
    }
    
    func constrainIcons() {
        constrain(icon: redIcon)
        constrain(icon: blueIcon)
        constrain(icon: greenIcon)
        constrain(icon: yellowIcon)
    }
    
    func constrain(textField: UITextField) {
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenHeightOf(figmaSize: 45)),
            textField.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 330))
        ])
    }
    
    func constrain(label: UILabel) {
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenHeightOf(figmaSize: 24)),
            label.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 125))
        ])
    }
    
    func constrain(icon: UIButton) {
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 40)),
            icon.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 40))
        ])
    }
    
    func adjustAddButtonCorners() {
        addingButton.layer.cornerRadius = addingButton.bounds.height / 2
    }
    
    func adjustFontSizes() {
        //ფიგმას ზომების მიხედვით ფონტის ზომების მიხედვით სკალირება
        let addingButtonFontSizeaccordingToWidth = addingButton.bounds.height * (14 / 48)
        addingButton.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: addingButtonFontSizeaccordingToWidth)
        titleLabel.font = UIFont(name: "FiraGO-Medium", size: addingButtonFontSizeaccordingToWidth)
        descriptionLabel.font = UIFont(name: "FiraGO-Medium", size: addingButtonFontSizeaccordingToWidth)
        iconSelectionLabel.font = UIFont(name: "FiraGO-Medium", size: addingButtonFontSizeaccordingToWidth)
        let textFieldFontSizeaccordingToWidth = addingButton.bounds.height * (12 / 45)
        titleTextfield.font = UIFont(name: "FiraGO-Medium", size: textFieldFontSizeaccordingToWidth)
        descriptionTextfield.font = UIFont(name: "FiraGO-Medium", size: textFieldFontSizeaccordingToWidth)
        
    }
    
    func scaledSizeAccordingToScreenWidthOf(figmaSize: CGFloat) -> CGFloat {
        (figmaSize / 375) * UIScreen.main.bounds.size.width
    }
    
    func scaledSizeAccordingToScreenHeightOf(figmaSize: CGFloat) -> CGFloat {
        (figmaSize / 812) * UIScreen.main.bounds.size.height
    }
    
    func getTextfieldWith(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.05)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1).cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.36, green: 0.38, blue: 0.44, alpha: 1)]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        return textField
    }
    
    func getLabelWith(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont(name: "FiraGO-Medium", size: scaledSizeAccordingToScreenHeightOf(figmaSize: 14))
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func getLabelTextFieldStackViewWith(label: UILabel, textField: UITextField) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [label,
         textField
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
    
    func getButtonWith(image: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: image), for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.selectIcon(sender: button, image: image)
        }), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeBordersOfIconsClear() {
        setBorderColor(of: redIcon, with: UIColor.clear.cgColor)
        setBorderColor(of: blueIcon, with: UIColor.clear.cgColor)
        setBorderColor(of: greenIcon, with: UIColor.clear.cgColor)
        setBorderColor(of: yellowIcon, with: UIColor.clear.cgColor)
    }
    
    func setBorderColor(of view: UIView, with color: CGColor) {
        view.layer.borderWidth = 1
        view.layer.borderColor = color
    }
    
    func textfieldIsNotEmpty(for textfield: UITextField) -> Bool {
        if textfield.text != "" {
            setBorderColor(of: textfield, with: UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1).cgColor)
            if textfield === titleTextfield{
                card.title = textfield.text
            } else {
                card.description = textfield.text
            }
            return true
        } else {
            setBorderColor(of: textfield, with: UIColor.red.cgColor)
            return false
        }
    }
    
    func checkIfIconIsSelectedAndAddCard() {
        if card.icon != nil {
            delegate?.addCard(card: card)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func add() {
        if textfieldIsNotEmpty(for: titleTextfield) && textfieldIsNotEmpty(for: descriptionTextfield) {
            checkIfIconIsSelectedAndAddCard()
        }
    }
    
    func selectIcon(sender: UIButton, image: String) {
        card.icon = image
        makeBordersOfIconsClear()
        setBorderColor(of: sender, with: UIColor.white.cgColor)
    }
}

