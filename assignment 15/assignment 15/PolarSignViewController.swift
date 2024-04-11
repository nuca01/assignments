//
//  PolarSignViewController.swift
//  assignment 15
//
//  Created by nuca on 11.04.24.
//

import UIKit

class PolarSignViewController: UIViewController {
    var viewConroller: ColorChangableDelegate?
    var polarSignName: String?
    lazy var zodiacImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(polarSignName!)")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var zodiacNameLabel: UILabel = {
        let label = UILabel()
        label.text = "\(polarSignName!)"
        label.font = UIFont(name: "sylfaen", size: 24)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var changeColorToBlueButton: UIButton = {
        let button = UIButton()
        button.setTitle("ლურჯი", for: .normal)
        button.titleLabel?.font = UIFont(name: "Sylfaen", size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(pressedBlue), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var changeColorToRedButton: UIButton = {
        let button = UIButton()
        button.setTitle("წითელი", for: .normal)
        button.titleLabel?.font = UIFont(name: "Sylfaen", size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(pressedRed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 25.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [changeColorToRedButton,
         changeColorToBlueButton
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        addConstraintsTozodiacImage()
        addconstraintsToButtonsStackView()
        addConstraintsToRedButton()
        addConstraintsToBlueButton()
    }
    
    func addBackground(){
        view.backgroundColor = UIColor(patternImage: UIImage(named: "zodiacImage")!)
    }
    func addConstraintsTozodiacImage() {
        view.addSubview(zodiacImage)
        addViewConstraints(
            view: zodiacImage,
            height: 194,
            width: 165,
            centerXAnchorEqualTo: view.centerXAnchor,
            centerYAnchorEqualTo: view.centerYAnchor
        )
    }
    func addConstraintsToRedButton() {
        addViewConstraints(
            view: changeColorToRedButton,
            height: 46
        )
    }
    func addConstraintsToBlueButton() {
        addViewConstraints(
            view: changeColorToBlueButton,
            height: 46
        )
    }
    func addconstraintsToButtonsStackView(){
        view.addSubview(buttonsStackView)
        addViewConstraints(
            view: buttonsStackView,
            bottomAnchorSeparationInRespectTo: view.safeAreaLayoutGuide.bottomAnchor,
            bottomAnchorSeparationConstant: -20,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 20,
            trailingAnchorSeparationInRespectTo: view.trailingAnchor,
            trailingAnchorSeparationConstant: -20
        )
    }
    func addViewConstraints(
        view: UIView,
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
        if let bottomAnchorSeparationConstant, let bottomAnchorSeparationInRespectTo {
            view.bottomAnchor.constraint(
                equalTo: bottomAnchorSeparationInRespectTo,
                constant: bottomAnchorSeparationConstant
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

    @objc func pressedBlue() {
        viewConroller?.changeColor(color: UIColor.blue)
        navigationController?.popViewController(animated: true)
        navigationController?.popViewController(animated: true)
    }
    @objc func pressedRed() {
        viewConroller?.changeColor(color: UIColor.red)
        navigationController?.popViewController(animated: true)
        navigationController?.popViewController(animated: true)
    }

}

