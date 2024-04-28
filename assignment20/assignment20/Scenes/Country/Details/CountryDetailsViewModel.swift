//
//  CountryDetailsViewModel.swift
//  assignment20
//
//  Created by nuca on 27.04.24.
//

import Foundation

class CountryDetailsViewModel {
//    MARK: - Properties
    private let country: Country
    
    var officialCountryNameTitle: String {
        country.name?.official ?? "unavailable"
    }
    var commonCountryNameTitle: String {
        country.name?.common ?? "unavailable"
    }
    var countryIndependenceDescription: String {
        country.independent?.description ?? "unavailable"
    }
    var countryRegion: String {
        country.region ?? "unavailable"
    }
    var countryArea: String {
        String(country.area ?? 0)
    }
    var startOfTeWeek: String {
        country.startOfWeek ?? "unavailable"
    }
    var countryFlag: String {
        country.flags?.alt ?? "unavailable"
    }
    var openStreetMapsUrl: URL? {
        URL(string: country.maps?.openStreetMaps ?? "google.com")
    }
    var googleMapsUrl: URL? {
        URL(string: country.maps?.googleMaps ?? "google.com")
    }
    
    var onFetchImage: ((Data) -> Void)?
    
//    MARK: - Initilizers
    init(country: Country) {
        self.country = country
    }
    
//    MARK: - Methods
    private func fetchCountryFlag() {
        if let imageUrl = URL(string: country.flags?.png ?? "") {
            URLSession.shared.dataTask(with: imageUrl) { data, _ , _ in
                guard let data
                else {
                    return
                }
                self.onFetchImage?(data)
            }.resume()
        }
    }
    
    func loadFlag() {
        fetchCountryFlag()
    }
}
