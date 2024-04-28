//
//  CountryTableViewCellViewModel.swift
//  assignment20
//
//  Created by nuca on 27.04.24.
//

import Foundation

struct CountryTableViewCellViewModel {
//    MARK: - Properties
    private var country: Country
    
    var flagUrl: URL? {
        URL(string: country.flags?.png ?? "")
    }
    var countryName: String {
        country.name?.common ?? ""
    }
    
//    MARK: - Initilizers
    init(country: Country) {
        self.country = country
    }
}
