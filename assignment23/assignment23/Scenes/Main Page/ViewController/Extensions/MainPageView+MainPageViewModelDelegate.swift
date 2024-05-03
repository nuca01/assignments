//
//  MainPageView+MainPageViewModelDelegate.swift
//  assignment23
//
//  Created by nuca on 03.05.24.
//

extension MainPageViewController: MainPageViewModelDelegate {
    func dataFetched() {
        factsTableView.reloadData()
    }
}
