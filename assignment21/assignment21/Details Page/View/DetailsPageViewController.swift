//
//  DetailsPageViewController.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

class DetailsPageViewController: UIViewController {
    //MARK: - Properties
    var detailsPageViewModel: DetailsPageViewModel?
    var detailsPageView: DetailsPageView?
    
    //MARK: - Initilizers
    init(model: Country) {
        detailsPageView = DetailsPageView()

        detailsPageViewModel = DetailsPageViewModel()
        super.init(nibName: nil, bundle: nil)
        detailsPageView?.delegate = self
        detailsPageView?.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Lifecycle
    override func loadView() {
        view = detailsPageView
        view.backgroundColor = .white
    }
}
