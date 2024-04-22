//
//  NewsPageViewController.swift
//  assignment19
//
//  Created by nuca on 19.04.24.
//

import UIKit

class NewsPageViewController: UIViewController {
    //MARK: - Properties
    let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "надежда News"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
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
        getData()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //MARK: - Helper Methods
    func setUpUI(){
        view.backgroundColor = .white
        configureNewsTableView()
    }
    
    func configureNewsTableView() {
        view.addSubview(newsTableView)
        
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            newsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        newsTableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        
        newsTableView.separatorStyle = .none
    }
    
    func getData() {
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<NewsData, Error>) in
            switch result {
            case .success(let success):
                self.newsArray = success.list
                self.newsTableView.reloadData()
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
            }
        }
    }
}

