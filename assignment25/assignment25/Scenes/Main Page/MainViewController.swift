//
//  MainViewController.swift
//  assignment25
//
//  Created by Nuca on 11.05.24.
//

import UIKit

// UIView-ს შვილობილია რადგან კონტროლერის view-s ვუტოლებ
protocol MainViewControllerDelegate: UIView {
    func didLoad()
}

final class MainViewController: UIViewController {
    //MARK: - Properties
    private var mainViewModel: MainViewDelegate
    private var mainView: MainViewControllerDelegate
    
    //MARK: - Initialisers
    init(mainViewModel: MainViewDelegate, mainView: MainViewControllerDelegate) {
        self.mainViewModel = mainViewModel
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.didLoad()
        view = mainView
    }
}

//MARK: - MainViewDelegate Extension
extension MainViewController: MainViewDelegate {
    
    func getSongTitle() -> String {
        mainViewModel.getSongTitle()
    }
    
    func getSongArtist() -> String {
        mainViewModel.getSongArtist()
    }
    
    func getSongLength() -> Double {
        mainViewModel.getSongLength()
    }
    
    func getSongCoverImageName() -> String {
        mainViewModel.getSongCoverImageName()
    }
}
