//
//  ViewConstraintFunctions.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

extension DetailsPageView {
    func constrainAboutFlagLabel() {
        aboutFlagLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 42).isActive = true
    }
    
    func constrainInformationLabelsStackview() {
        informationLabelsStackview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 42).isActive = true
    }

    func constrainScrollView() {
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: centerYAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
    
    func constrainScrollViewStackView() {
        scrollView.addSubview(scrollViewStackview)
        NSLayoutConstraint.activate([
            scrollViewStackview.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1),
            scrollViewStackview.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),            scrollViewStackview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -1)
        ])
    }
    
    func configureFlagImage() {
        let widthACCordingToScreen = UIScreen.main.bounds.width - 40
        let heightAccordingToWidth = widthACCordingToScreen / 1.5
        NSLayoutConstraint.activate([
            shadowView.widthAnchor.constraint(equalToConstant: widthACCordingToScreen),
            shadowView.heightAnchor.constraint(equalToConstant: heightAccordingToWidth)
        ])
        shadowView.addSubview(flagImage)
        NSLayoutConstraint.activate([
            flagImage.widthAnchor.constraint(equalToConstant: widthACCordingToScreen),
            flagImage.heightAnchor.constraint(equalToConstant: heightAccordingToWidth),
            flagImage.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
            flagImage.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor),
        ])
    }
}
