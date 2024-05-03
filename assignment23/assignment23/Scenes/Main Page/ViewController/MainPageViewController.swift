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
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Purr-fectly Fascinating Facts About Cats🙀🙀"
        label.numberOfLines = 0
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var factsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .clear
        tableview.rowHeight = UITableView.automaticDimension
        tableview.tableHeaderView = headerLabel
        tableview.separatorInset = .zero
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
        view.backgroundColor = .systemBackground
        addAndConstrainFactsTableView()
        constrainHeaderLabel()
    }
    
    func addAndConstrainFactsTableView() {
        view.addSubview(factsTableView)
        NSLayoutConstraint.activate([
            factsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            factsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            factsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            factsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5)
        ])
        
        factsTableView.register(FactsCell.self, forCellReuseIdentifier: FactsCell.identifier)
    }
    
    private func constrainHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.widthAnchor.constraint(equalTo: factsTableView.widthAnchor)
        ])
    }

}
