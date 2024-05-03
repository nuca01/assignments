//
//  MainPageViewModel.swift
//  assignment23
//
//  Created by nuca on 03.05.24.
//

import Foundation
import NetworkingService
protocol MainPageViewModelDelegate {
    func dataFetched()
}

class MainPageViewModel {
    
    //    MARK: - Properties
    var delegate: MainPageViewModelDelegate?
    let urlString = "https://catfact.ninja/facts?max_length=100000000000&limit=10000000"
    var factsArray = [MainPageModel.Data]()
    
    //    MARK: - Functions
    
    func getData() {
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<MainPageModel, Error>) in
            switch result {
            case .success(let success):
                self.factsArray = success.data
                self.delegate?.dataFetched()
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
            }
        }
    }
}
