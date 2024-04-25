//
//  MainPageViewController.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

class MainPageViewController: UIViewController {
//    MARK: - Properties
    var mainPageView: MainPageView
    var viewModel: MainPageViewModel

//    MARK: - Initializers
    init() {
        mainPageView = MainPageView()
        viewModel = MainPageViewModel()
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        mainPageView.delegate = self
        mainPageView.setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainPageView
    }
    
//    MARK: - Function
    func pushViewController(nextViewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(nextViewController, animated: animated)
    }
}
