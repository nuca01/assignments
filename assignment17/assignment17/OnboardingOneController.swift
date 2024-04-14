//
//  ViewController.swift
//  assignment17
//
//  Created by nuca on 13.04.24.
//

import UIKit

class OnboardingOneController: UIViewController {
    lazy var gradientView = {
        let view = UIView()
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [
            UIColor(red: 0.094, green: 0.101, blue: 0.125, alpha: 1).cgColor,
            UIColor(red: 0.094, green: 0.094, blue: 0.176, alpha: 1).cgColor
        ]
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "შედი\nაპლიკაციაში\nდა იწუწუნე\nრამდენიც გინდა"
        label.numberOfLines = 4
        label.font = UIFont(name: "FiraGO-Book", size: 30)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setLineHeight(lineHeight: 48)
        return label
    }()
    lazy var popUpImage1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat popup")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var popUpImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat popup-1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var popUpImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat popup-2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var popUpImage4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chat popup-3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAndConstrainGradientView()
        addAndConstrainInstructionsLabel()
    }
    func addFloatingImages(){
        
    }
//    func addAndConstrainPopUpImage1() {
//        view.addSubview(popUpImage1)
//        popUpImage1.addViewConstraints() {
//            
//        }
//    }
    func addAndConstrainInstructionsLabel() {
        view.addSubview(instructionsLabel)
        instructionsLabel.addViewConstraints(
            height: 192,
            width: 263,
            leadingAnchorSeparationInRespectTo: view.safeAreaLayoutGuide.leadingAnchor,
            leadingAnchorSeparationConstant: 10
        )
        instructionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.bounds.height / 15).isActive = true
    }
    func addAndConstrainGradientView() {
        view.addSubview(gradientView)
        gradientView.addViewConstraints(
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 0,
            bottomAnchorSeparationInRespectTo: view.bottomAnchor,
            bottomAnchorSeparationConstant: 0,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 0,
            trailingAnchorSeparationInRespectTo: view.trailingAnchor,
            trailingAnchorSeparationConstant: 0
        )
    }

}

