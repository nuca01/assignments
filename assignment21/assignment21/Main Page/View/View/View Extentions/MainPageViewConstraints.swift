//
//  MainPageViewConstraints.swift
//  assignment21
//
//  Created by nuca on 25.04.24.
//

import UIKit

extension MainPageView {
    
    func constrainWholeStackView() {
        addSubview(wholeStackView)
        NSLayoutConstraint.activate([
            wholeStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            wholeStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            wholeStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            wholeStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    func configureCountriesTableView() {
        NSLayoutConstraint.activate([
            countriesTableView.trailingAnchor.constraint(equalTo: wholeStackView.trailingAnchor, constant: -15),
            countriesTableView.leadingAnchor.constraint(equalTo: wholeStackView.leadingAnchor, constant: 15)
        ])
        
        countriesTableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        
        countriesTableView.separatorStyle = .none
    }
    
    func constrainSearchBar() {
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalToConstant: 35),
            searchBar.widthAnchor.constraint(equalTo: wholeStackView.widthAnchor),
            searchBar.centerXAnchor.constraint(equalTo: wholeStackView.centerXAnchor)
        ])
    }
    
    func constrainHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: wholeStackView.leadingAnchor, constant: 15)
        ])
    }
}
