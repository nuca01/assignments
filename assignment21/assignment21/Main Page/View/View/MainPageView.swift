//
//  MainPageView.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit

protocol MainPageViewDelegate {
    func passDataTo(
        nextViewController: DetailsPageViewController,
        using indexPath: IndexPath,
        and tableView: UITableView)
    func getData()
    func getCountriesCount() -> Int
    func getCountryFor(index: Int) -> Country
    func pushViewController(nextViewController: UIViewController, animated: Bool)
    func filterContentForSearchText(_ : String)
}

class MainPageView: UIView {
    
//    MARK: - Properties
    var delegate: MainPageViewDelegate?
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Countries"
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //ხაზები რომ არ გამოჩნდეს
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.barTintColor = UIColor(named: "Background Color")
        return searchBar
    }()
    
    lazy var countriesTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        //tableview.tableHeaderView = searchBarAndTitleStackView
        tableview.backgroundColor = .clear
        return tableview
    }()
    
    lazy var searchBarAndTitleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [headerLabel,
         searchBar
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        [searchBarAndTitleStackView,
         countriesTableView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
//    MARK: - Initilizers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//  MARK: - function
    func setUpUI(){
        delegate!.getData()
        backgroundColor = UIColor(named: "Background Color")
        constrainWholeStackView()
        configureCountriesTableView()
        constrainSearchBar()
        constrainHeaderLabel()
    }
    
}
