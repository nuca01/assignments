//
//  DetailsPageViewController.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

class DetailsPageViewController: UIViewController {
//    MARK: - Properties
    var detailsPageViewModel: DetailsPageViewModel?
    var detailsPageView: DetailsPageView?
    
//    MARK: - Initilizers
    init(model: Country) {
        detailsPageViewModel = DetailsPageViewModel()
        detailsPageViewModel?.country = model
        detailsPageView = DetailsPageView()
        super.init(nibName: nil, bundle: nil)
        detailsPageView?.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Lifecycle
    override func loadView() {
        view = detailsPageView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsPageView?.setUpUI()
    }
}
