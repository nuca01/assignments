//
//  MainViewCintroller+TableView.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

extension MainPageView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate!.getCountriesCount()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier) as! CountryCell
        let currentCountry = delegate!.getCountryFor(index: indexPath.row)
        cell.updateCell(with: currentCountry)
        return cell
    }
}

extension MainPageView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCountry = delegate!.getCountryFor(index: indexPath.row)
        let nextViewController = DetailsPageViewController(model: currentCountry)
        //cell-იდან ფოტოს ამოღება და შემდეგი კონტროლერისთვის გადაწოდება
        if let cell = tableView.cellForRow(at: indexPath) as? CountryCell {
            nextViewController.detailsPageView!.flagImage.image = cell.flagImage.image
        }
        nextViewController.detailsPageViewModel!.country = currentCountry
        delegate?.pushViewController(nextViewController: nextViewController, animated: true)
    }
}

extension MainPageView {
    
    func configureCountriesTableView() {
        addSubview(countriesTableView)
        
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            countriesTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            countriesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            countriesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        countriesTableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        
        countriesTableView.separatorStyle = .none
    }
    
    func reloadTableView(){
        countriesTableView.reloadData()
    }
}
