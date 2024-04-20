//
//  ViewController.swift
//  assignment19
//
//  Created by nuca on 19.04.24.
//

import UIKit

class NewsPageViewController: UIViewController {
    //MARK: - Properties
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "надежда News"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var newsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableHeaderView = headerLabel
        return tableview
    }()
    var newsArray = [News]()
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    //MARK: - Helper Methods
    func setUpUI(){
        view.addSubview(newsTableView)
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            newsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        newsTableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
    }
}

