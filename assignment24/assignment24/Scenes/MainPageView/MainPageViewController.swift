//
//  MainPageViewController.swift
//  assignment24
//
//  Created by Nuca on 08.05.24.
//

import UIKit
protocol mainPageViewControllerDelegate: UIView {
    func didLoad(with: MainPageViewDelegate, at: IndexPath?)
    func galleryDataUpdated(with photos: [PhotoModel])
}
class MainPageViewController: UIViewController, MainPageViewDelegate, ViewModelDelegate {
    
    
    //MARK: - Properties
    var pageView: MainPageView = MainPageView()
    var viewModel: ViewModel = ViewModel()
    
    //MARK: - Initialisers
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        pageView.didLoad(with: self, at: nil)
        viewModel.didLoad(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        view = pageView
    }
    //MARK: - Function
    
    func dataFetched(of photos: [PhotoModel]) {
        pageView.galleryDataUpdated(with: photos)
    }
    
    func getPhotosFor(index: Int) -> PhotoModel {
        viewModel.getPhotosFor(index: index)
    }
    
    func didSelectPhoto(at index: IndexPath) {
        let fullScreenViewController = FullScreenViewController(index: index, viewModel: viewModel)
        navigationController?.pushViewController(fullScreenViewController, animated: true)
    }
}
