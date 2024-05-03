//
//  MainPageViewController.swift
//  assignment23
//
//  Created by nuca on 03.05.24.
//

import UIKit

protocol MainPageViewControllerDelegate {
    var factsCount: Int {get}
    func getFactFor(index: Int) -> MainPageModel.Data
    func viewDidLoad(for delegate: MainPageViewModelDelegate)
}

class MainPageViewController: UIViewController {
//    MARK: - Properties
    var delegate: MainPageViewControllerDelegate = MainPageViewModel()
    
    lazy var factsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .clear
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 100
        return tableview
    }()
    
//    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.viewDidLoad(for: self)
        setUpUI()
    }
    
//    MARK: - Methods
    func setUpUI() {
        view.backgroundColor = .white
        addAndConstrainFactsTableView()
    }
    
    func addAndConstrainFactsTableView() {
        view.addSubview(factsTableView)
        NSLayoutConstraint.activate([
            factsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            factsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            factsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            factsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        factsTableView.register(FactsCell.self, forCellReuseIdentifier: FactsCell.identifier)
    }

}
