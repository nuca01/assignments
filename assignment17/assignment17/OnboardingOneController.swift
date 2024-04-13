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
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientView()
        
    }
    func addGradientView() {
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

