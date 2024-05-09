//
//  MainPageViewModel.swift
//  assignment24
//
//  Created by Nuca on 09.05.24.
//

import Foundation
import NetworkingService
protocol ViewModelDelegate {
    func dataFetched(of photos: [PhotoModel])
}

class ViewModel {
    //    MARK: - Properties
    var delegate: ViewModelDelegate?
    let urlString = "https://api.unsplash.com/photos/?per_page=50&client_id=i3cjhFkQJ1nxK8aI0mvS_Y2c0WiOs7loFp-yOJ6FWfs"
    var photosArray = [PhotoModel]()
    var dataIsFetched: Bool {
        photosArray.count != 0
    }
    //    MARK: - Functions
    func getData() {
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<[PhotoModel], Error>) in
            switch result {
            case .success(let success):
                self.photosArray = success
                self.delegate?.dataFetched(of: self.photosArray)
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
            }
        }
    }
    
    func didLoad(with delegate: ViewModelDelegate) {
        self.delegate = delegate
        if dataIsFetched {
            self.delegate?.dataFetched(of: self.photosArray)
        } else {
            getData()
        }
    }
    
    func getPhotosFor(index: Int) -> PhotoModel {
        return photosArray[index]
    }
}
