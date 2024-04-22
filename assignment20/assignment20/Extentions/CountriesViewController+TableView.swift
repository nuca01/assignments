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
        countriesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier) as! CountryCell
        let currentCountry = countriesArray[indexPath.row]
        cell.updateCell(with: currentCountry)
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextViewController = CountriesViewController()
//        //cell-იდან ინფორმაციის ამოღება და შემდეგი კონტროლერისთვის გადაწოდება
//        if let cell = tableView.cellForRow(at: indexPath) as? CountryCell {
//            nextViewController.image.image = cell.backgroundImage.image
//            nextViewController.timeLabel.text = cell.timeLabel.text
//            nextViewController.descriptionTextView.text = cell.titleLabel.text
//        }
//        navigationController?.pushViewController(nextViewController, animated: true)
//    }
}
