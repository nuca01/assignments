//
//  MainPageViewDelegate Extention.swift
//  assignment21
//
//  Created by nuca on 25.04.24.
//

import UIKit

extension MainPageViewController: MainPageViewDelegate {
    func getData() {
        viewModel.getData()
    }
    
    func passDataTo(
        nextViewController: DetailsPageViewController,
        using indexPath: IndexPath,
        and tableView: UITableView
    ) {
        viewModel.passDataTo(nextViewController: nextViewController, using: indexPath, and: tableView)
    }
    
    func getCountriesCount() -> Int {
        viewModel.getCountriesCount()
    }
    
    func getCountryFor(index: Int) -> Country {
        viewModel.getCountryFor(index: index)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        viewModel.filterContentForSearchText(searchText)
    }
}
