//
//  CountriesViewModel.swift
//  assignment20
//
//  Created by nuca on 27.04.24.
//

import Foundation

class CountriesViewModel {
//    MARK: - Properties
    weak var view: CountriesViewController?
    private let urlString = "https://restcountries.com/v3.1/all"
    
    private var countriesArray: [Country] = [] {
        didSet { onCountryUpdated?() }
    }
    
    private var filteredcountryTableViewCellViewModel: [CountryTableViewCellViewModel] = []
    
    private var countryTableViewCellViewModelPrivate: [CountryTableViewCellViewModel] = [] {
        didSet { onCountryUpdated?() }
    }
    
    var countryTableViewCellViewModel: [CountryTableViewCellViewModel]{
        isFiltering ? filteredcountryTableViewCellViewModel: countryTableViewCellViewModelPrivate
    }
    
    var numberOfCountries: Int {
        isFiltering ? filteredcountryTableViewCellViewModel.count: countriesArray.count
    }
    
    var firstLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: "First Time Logged In")
    }
    
    var isFiltering = false
    
    var onCountryUpdated: (() -> Void)?
    
    var onCountriesSelected: ((Country) -> Void)?
    
//    MARK: - LifeCycles
    func didLoad(view: CountriesViewController){
        self.view = view
        getCountries()
        filterCountries()
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
                self.countryTableViewCellViewModelPrivate = success.map{
                    CountryTableViewCellViewModel(country: $0)
                }
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
            }
        }
    }
    
//    MARK: - View Closure Initializators
    func filterCountries() {
        view?.onCountriesFiltered = { searchText in
            if searchText == "" {
                self.isFiltering = false
            } else {
                self.isFiltering = true
            }
            self.filteredcountryTableViewCellViewModel = self.countryTableViewCellViewModelPrivate.filter {
                $0.countryName.lowercased().contains(searchText.lowercased())
            }
            self.onCountryUpdated?()
        }
    }
    
//    MARK: - Navigation
    func navigateToCountryDetails(index: Int) {
        self.onCountriesSelected?(countriesArray[index])
    }
    
}
