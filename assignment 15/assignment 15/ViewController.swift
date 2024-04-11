//
//  ViewController.swift
//  assignment 15
//
//  Created by nuca on 10.04.24.
//

import UIKit
protocol ColorChangableDelegate {
    func changeColor(color: UIColor)
}
class ViewController: UIViewController, ColorChangableDelegate {
    lazy var hubName: UILabel = {
        let label = UILabel()
        label.text = "მიშა ცაგარელის ჰაბი!"
        label.font = UIFont(name: "systemFont", size: 24)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები.!"
        label.font = UIFont(name: "sylfaen", size: 16)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    lazy var zodiacName: UILabel = {
        let label = UILabel()
        label.text = "ზოდიაქოს სახელი"
        label.font = UIFont(name: "sylfaen", size: 12)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var zodiacTextField: UITextField = {
        let textField =  UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: gemini", //ინგლუსრი ტექსტი მოვიძიე და ბარემ ინგლუსრზე გავაკეთე
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.49, green: 0.49, blue: 0.51, alpha: 1)]
        )
        textField.textColor = UIColor.white
        textField.font = UIFont(name: "Sylfaen", size: 12)
        textField.layer.borderColor = UIColor.white.cgColor
        textField.backgroundColor = UIColor.clear
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("შემდეგ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Sylfaen", size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.31, green: 0.0, blue: 0.71, alpha: 1)
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var hubNameandAppDescriptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [hubName,
         appDescriptionLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var nameAndZodiacTextfieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [zodiacName,
         zodiacTextField
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var ButtonandTextfieldStackViewStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [nameAndZodiacTextfieldStackView,
         nextButton
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var wholeStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 91.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [hubNameandAppDescriptionStackView,
         ButtonandTextfieldStackViewStackview
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        addAndConstrainWholeStackview()
        addConstraintsToHubNameLabel()
        addConstraintsToZodiacNameLabel()
        addConstraintsToZodiacTextfield()
        addConstraintsToNextButton()
    }
    
    func addBackground(){
        view.backgroundColor = UIColor(patternImage: UIImage(named: "zodiacImage")!)
    }
    func addAndConstrainWholeStackview() {
        view.addSubview(wholeStackview)
        addViewConstraints(
            view: wholeStackview,
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 71,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 20,
            trailingAnchorSeparationInRespectTo: view.trailingAnchor,
            trailingAnchorSeparationConstant: -20
        )
    }
    func addConstraintsToHubNameLabel() {
        addViewConstraints(
            view: hubName,
            height: 34
        )
    }
    func addConstraintsToZodiacNameLabel() {
        addViewConstraints(
            view: zodiacName,
            height: 20
        )
    }
    func addConstraintsToZodiacTextfield() {
        addViewConstraints(
            view: zodiacTextField,
            height: 44
        )
        addPadding()
    }
    func addConstraintsToNextButton() {
        addViewConstraints(
            view: nextButton,
            height: 46
        )
    }
    func addViewConstraints(
        view: UIView,
        height: CGFloat? = nil,
        width: CGFloat? = nil,
        topAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        topAnchorSeparationConstant: CGFloat? = nil,
        leadingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        leadingAnchorSeparationConstant: CGFloat? = nil,
        trailingAnchorSeparationInRespectTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        trailingAnchorSeparationConstant: CGFloat? = nil,
        centerXAnchorEqualTo: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        centerYAnchorEqualTo: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil
    ) {
        view.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        if let height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let topAnchorSeparationConstant, let topAnchorSeparationInRespectTo {
            view.topAnchor.constraint(
                equalTo: topAnchorSeparationInRespectTo,
                constant: topAnchorSeparationConstant
            ).isActive = true
        }
        if let leadingAnchorSeparationConstant, let leadingAnchorSeparationInRespectTo {
            view.leadingAnchor.constraint(
                equalTo: leadingAnchorSeparationInRespectTo,
                constant: leadingAnchorSeparationConstant
            ).isActive = true
        }
        if let trailingAnchorSeparationConstant, let trailingAnchorSeparationInRespectTo {
            view.trailingAnchor.constraint(equalTo: trailingAnchorSeparationInRespectTo, constant: trailingAnchorSeparationConstant).isActive = true
        }
        if let centerXAnchorEqualTo {
            view.centerXAnchor.constraint(equalTo: centerXAnchorEqualTo).isActive = true
        }
        if let centerYAnchorEqualTo {
            view.centerYAnchor.constraint(equalTo: centerYAnchorEqualTo).isActive = true
        }
    }
    func addPadding() {
       let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
       zodiacTextField.leftView = paddingView
       zodiacTextField.leftViewMode = .always
    }
    func changeColor(color: UIColor) {
        view.backgroundColor = color
    }

    @objc func pressed() {
        switch zodiacTextField.text?.lowercased() {
        case "aries":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.aries
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "taurus":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.taurus
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "gemini":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.gemini
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "sagittarius":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.saggitarius
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "cancer":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.cancer
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "libra":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.libra
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "scorpio":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.scorpio
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "capricorn":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.capricorn
            navigationController?.pushViewController(nextViewController, animated: true)
        case "leo":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.leo
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "aquarius":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.aquarious
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "virgo":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.virgo
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        case "pisces":
            zodiacTextField.layer.borderColor = UIColor.white.cgColor
            let nextViewController = ZodiacViewController()
            nextViewController.mainZodiac = nextViewController.pisces
            nextViewController.viewConroller = self
            navigationController?.pushViewController(nextViewController, animated: true)
        default:
            zodiacTextField.layer.borderColor = UIColor.red.cgColor
        }
    }

}

