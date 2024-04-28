//
//  CountriesViewController+TableView.swift
//  assignment20
//
//  Created by nuca on 22.04.24.
//

import UIKit

extension CountriesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCountries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier) as! CountryTableViewCell
        let countryCellViewModel = viewModel.countryTableViewCellViewModel[indexPath.row]
        cell.updateCell(with: countryCellViewModel)
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToCountryDetails(index: indexPath.row)
    }
}
