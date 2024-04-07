//
//  ViewController.swift
//  assignment14
//
//  Created by nuca on 06.04.24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    lazy var computerImage: UIImageView = {
        let image = UIImage(systemName: "lock.laptopcomputer")
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "მოგესალმებით!"
        label.font = UIFont(name: "sylfaen", size: 24)
        label.setTextSpacingBy(value: 24 * -0.005)
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
    lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.text = "ავტორიზაცია"
        label.font = UIFont(name: "systemFont", size: 14)
        label.font = label.font.withWeight(weight: UIFont.Weight(400))
        label.setLineHeight(lineHeight: 19.64)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "სრული სახელი"
        label.font = UIFont(name: "Sylfaen", size: 12)
        label.setTextSpacingBy(value: 24 * 0.005)
        label.font = label.font.withWeight(weight: UIFont.Weight(400))
        label.setLineHeight(lineHeight: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nameTextField: UITextField = {
        let textField =  UITextField()
        textField.placeholder = "მაგ: ქეთინო ფერი"
        textField.font = UIFont(name: "Sylfaen", size: 12)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
//        textField.autocorrectionType = UITextAutocorrectionType.no
//        textField.keyboardType = UIKeyboardType.default
//        textField.returnKeyType = UIReturnKeyType.done
//        textField.clearButtonMode = UITextField.ViewMode.whileEditing
//        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    lazy var eMailLabel: UILabel = {
        let label = UILabel()
        label.text = "ელ. ფოსტა"
        label.font = UIFont(name: "Sylfaen", size: 12)
        label.setTextSpacingBy(value: 24 * 0.005)
        label.font = label.font.withWeight(weight: UIFont.Weight(400))
        label.setLineHeight(lineHeight: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var eMailTextField: UITextField = {
        let textField =  UITextField()
        textField.placeholder = "მაგ: kusuna@mail.ru"
        textField.font = UIFont(name: "Sylfaen", size: 12)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
//        textField.autocorrectionType = UITextAutocorrectionType.no
//        textField.keyboardType = UIKeyboardType.default
//        textField.returnKeyType = UIReturnKeyType.done
//        textField.clearButtonMode = UITextField.ViewMode.whileEditing
//        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "პაროლი"
        label.font = UIFont(name: "Sylfaen", size: 12)
        label.setTextSpacingBy(value: 24 * 0.005)
        label.font = label.font.withWeight(weight: UIFont.Weight(400))
        label.setLineHeight(lineHeight: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var passwordTextField: UITextField = {
        let textField =  UITextField()
        textField.placeholder = "მაგ: busuna123, jajanaIsMyKumiri2010"
        textField.font = UIFont(name: "Sylfaen", size: 12)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
//        textField.autocorrectionType = UITextAutocorrectionType.no
//        textField.keyboardType = UIKeyboardType.default
//        textField.returnKeyType = UIReturnKeyType.done
//        textField.clearButtonMode = UITextField.ViewMode.whileEditing
//        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
//    lazy var logInButton: UIButton = {
//        
//    }()
    
    lazy var instructionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [greetingLabel,
         instructionsLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var logInStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [logInLabel,
         buttonAndTextFieldsStackView,
         linesAndOrStackView,
         googleAndFacebookStackView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var textFieldsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [nameTextFieldStackView,
         eMailTextFieldStackView,
         passwordTextFieldStackView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var nameTextFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [fullNameLabel,
         nameTextField
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var eMailTextFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [eMailLabel,
         eMailTextField
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var passwordTextFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [passwordLabel,
         passwordTextField,
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var buttonAndTextFieldsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var linesAndOrStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 11.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var googleAndFacebookStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(computerImage)
        addViewConstraints(
            view: computerImage,
            height: 50,
            width: 90,
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 50,
            centerXAnchorEqualTo: view.centerXAnchor
        )
        view.addSubview(instructionsStackView)
        addViewConstraints(
            view: instructionsStackView,
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 110,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 20,
            trailingAnchorSeparationInRespectTo: view.trailingAnchor,
            trailingAnchorSeparationConstant: -20,
            centerXAnchorEqualTo: view.centerXAnchor
        )
        addViewConstraints(
            view: greetingLabel,
            height: 34
        )
        view.addSubview(logInStackView)
        addViewConstraints(
            view: logInStackView,
            topAnchorSeparationInRespectTo: instructionsLabel.bottomAnchor,
            topAnchorSeparationConstant: 20,
            centerXAnchorEqualTo: view.centerXAnchor
        )
        addViewConstraints(
            view: logInLabel,
            height: 40,
            width: 326
        )
        addViewConstraints(
            view: fullNameLabel,
            height: 20,
            width: 327
        )
        addViewConstraints(
            view: nameTextField,
            height: 44,
            width: 335
        )
        addViewConstraints(
            view: eMailTextField,
            height: 68,
            width: 335
        )
        addViewConstraints(
            view: eMailLabel,
            height: 20,
            width: 327
        )
        addViewConstraints(
            view: passwordTextField,
            height: 68,
            width: 335
        )
        addViewConstraints(
            view: passwordLabel,
            height: 20,
            width: 327
        )
        addBottomBorderTo(label: logInLabel)
        configureTapGesture()
        
        
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
        view.frame = CGRect(x: 10, y: 10, width: 10, height: 10) //არ ვიცი რამდენად საჭიროა რადგან მაინც ქონსთრეინთები უნდა დავადო
        if let height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        //არ ვიცი if let ის შიგნით რამე თუ იცვლება და მძიმე როგორ მუშაობს
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
    func addBottomBorderTo (label: UILabel) {
        let bottomBorder = CALayer()
            bottomBorder.frame = CGRect(x:0, y: 40, width: 326, height: 2)
            bottomBorder.backgroundColor = UIColor.blue.cgColor
            label.layer.addSublayer(bottomBorder)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === eMailTextField {
            if eMailTextField.isEmail() {
                textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                textField.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
        } else if textField === passwordTextField {
            if let text = textField.text {
                if text.count < 6 || text.count > 15 {
                    textField.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
                } else {
                    textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
                }
            } else {
                textField.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
            }
        }
        textField.resignFirstResponder()
        return true
    }
    func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap() {
        if eMailTextField.isFirstResponder {
            textFieldShouldReturn(eMailTextField)
        } else if passwordTextField.isFirstResponder {
            textFieldShouldReturn(passwordTextField)
        }
        view.endEditing(false)
    }
}

#Preview {
    UIViewController()
}
