//
//  CountriesViewModel.swift
//  assignment20
//
//  Created by nuca on 27.04.24.
//

import Foundation

class CountriesViewModel {
//    MARK: - Properties
    private let urlString = "https://restcountries.com/v3.1/all"
    
    private var countriesArray: [Country] = [] {
        didSet { onCountryUpdated?() }
    }
    
    var countryTableViewCellViewModel: [CountryTableViewCellViewModel] = [] {
        didSet { onCountryUpdated?() }
    }
    
    var numberOfCountries: Int {
        countriesArray.count
    }
    
    var firstLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: "First Time Logged In")
    }
    
    var onCountryUpdated: (() -> Void)?
    
    var onCountriesSelected: ((Country) -> Void)?
    
//    MARK: - LifeCycles
    func didLoad(){
        getCountries()
    }
    
//    MARK: - Child Method
    private func getCountries(){
        getData()
    }
    
//    MARK: - Requests
    private func getData() {
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<[Country], Error>) in
            switch result {
            case .success(let success):
                self.countriesArray = success
                self.countryTableViewCellViewModel = success.map{
                    CountryTableViewCellViewModel(country: $0)
                }
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
            }
        }
    }
    
//    MARK: - Navigation
    func navigateToCountryDetails(index: Int) {
        self.onCountriesSelected?(countriesArray[index])
    }
    
}
