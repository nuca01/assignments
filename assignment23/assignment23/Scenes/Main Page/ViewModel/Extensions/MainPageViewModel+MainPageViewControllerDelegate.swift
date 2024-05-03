//
//  MainPageViewModel+MainPageViewControllerDelegate.swift
//  assignment23
//
//  Created by nuca on 03.05.24.
//

import Foundation

extension MainPageViewModel: MainPageViewControllerDelegate {
    var factsCount: Int {
        factsArray.count
    }
    
    func getFactFor(index: Int) -> MainPageModel.Data {
        return factsArray[index]
    }
    
    func viewDidLoad(for delegate: MainPageViewModelDelegate) {
        getData()
        self.delegate = delegate
        delegate.dataFetched()
    }
}
