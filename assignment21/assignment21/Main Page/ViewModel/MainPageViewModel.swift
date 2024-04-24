//
//  MainPageViewModel.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

protocol MainPageViewModelDelegate {
    func reloadTableView()
}

class MainPageViewModel {
//    MARK: - Properties
    var delegate: MainPageViewModelDelegate?
    let urlString = "https://restcountries.com/v3.1/all"
    var countriesArray = [Country]()
    
//    MARK: - Functions
    func getData() {
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<[Country], Error>) in
            switch result {
            case .success(let success):
                self.countriesArray = success
                self.delegate?.reloadTableView()
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
            }
        }
    }
    
    func passDataTo(
        nextViewController: DetailsPageViewController,
        using indexPath: IndexPath,
        and tableView: UITableView) {
        if let cell = tableView.cellForRow(at: indexPath) as? CountryCell {
            nextViewController.detailsPageView!.flagImage.image = cell.flagImage.image
        }
            nextViewController.detailsPageViewModel!.country = countriesArray[indexPath.row]
    }
    
    func getCountriesCount() -> Int {
        return countriesArray.count
    }
    
    func getCountryFor(index: Int) -> Country {
        return countriesArray[index]
    }
}
