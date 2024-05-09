//
//  FullScreenViewController.swift
//  assignment24
//
//  Created by Nuca on 09.05.24.
//

import UIKit

protocol FullScreenViewControllerDelegate: UIView {
    func didLoad(with: FullScreenViewDelegate)
    func galleryDataUpdated(with photos: [PhotoModel])
}

class FullScreenViewController: UIViewController, FullScreenViewDelegate, ViewModelDelegate {
    
    //MARK: - Properties
    var fullPageView: FullScreenView = FullScreenView()
    var viewModel: ViewModel?
    var index: IndexPath?
    
    //MARK: - Initialisers
    init(index: IndexPath?, viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        viewModel.didLoad(with: self)
        fullPageView.didLoad(with: self)
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        view = fullPageView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let index = self.index {
            fullPageView.scrollToSelectedPhoto(at: index)
        }
    }
    //MARK: - Function
    
    func dataFetched(of photos: [PhotoModel]) {
        fullPageView.galleryDataUpdated(with: photos)
    }
    
    func getPhotosFor(index: Int) -> PhotoModel {
        viewModel!.getPhotosFor(index: index)
    }
    
    
}
