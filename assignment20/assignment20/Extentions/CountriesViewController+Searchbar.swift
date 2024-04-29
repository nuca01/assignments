//
//  CountriesViewController+Searchbar.swift
//  assignment20
//
//  Created by nuca on 29.04.24.
//

import UIKit

extension CountriesViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        onCountriesFiltered?(searchBar.text ?? "")
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        onCountriesFiltered?(searchBar.text ?? "")
//        self.searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        onCountriesFiltered?(searchBar.text ?? "")
    }
}
