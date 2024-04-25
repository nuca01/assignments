//
//  MainPageView+Searchbar.swift
//  assignment21
//
//  Created by nuca on 25.04.24.
//

import UIKit

extension MainPageView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        delegate?.filterContentForSearchText(searchBar.text ?? "")
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate?.filterContentForSearchText(searchBar.text ?? "")
        self.searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.filterContentForSearchText(searchBar.text ?? "")
    }
}
