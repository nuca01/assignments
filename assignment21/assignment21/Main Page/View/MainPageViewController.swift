//
//  MainPageViewController.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

class MainPageViewController: UIViewController, MainPageViewDelegate, MainPageViewModelDelegate {
    var mainPageView: MainPageView
    var viewModel: MainPageViewModel

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
        view.backgroundColor = .white
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    func getData() {
        viewModel.getData()
    }
    func passDataTo(
        nextViewController: DetailsPageViewController,
        using indexPath: IndexPath,
        and tableView: UITableView) {
        viewModel.passDataTo(nextViewController: nextViewController, using: indexPath, and: tableView)
    }
    func getCountriesCount() -> Int {
        viewModel.getCountriesCount()
    }
    func getCountryFor(index: Int) -> Country {
        viewModel.getCountryFor(index: index)
    }
    func reloadTableView() {
        mainPageView.reloadTableView()
    }
    func pushViewController(nextViewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(nextViewController, animated: animated)
    }
}
