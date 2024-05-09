//
//  FullScreenViewController.swift
//  assignment24
//
//  Created by Nuca on 09.05.24.
//

import UIKit

protocol FullScreenViewControllerDelegate: UIView {
    func didLoad(with: FullScreenViewDelegate, at: IndexPath?)
    func galleryDataUpdated(with photos: [PhotoModel])
}

class FullScreenViewController: UIViewController, FullScreenViewDelegate, ViewModelDelegate {
    
    //MARK: - Properties
    var fullPageView: FullScreenView = FullScreenView()
    var viewModel: ViewModel?
    
    //MARK: - Initialisers
    init(index: IndexPath?, viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        viewModel.didLoad(with: self)
        fullPageView.didLoad(with: self, at: index)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        view = fullPageView
    }
    //MARK: - Function
    
    func dataFetched(of photos: [PhotoModel]) {
        fullPageView.galleryDataUpdated(with: photos)
    }
    
    func getPhotosFor(index: Int) -> PhotoModel {
        viewModel!.getPhotosFor(index: index)
    }
}
