//
//  CountriesViewController.swift
//  assignment20
//
//  Created by nuca on 22.04.24.
//

import UIKit

class CountriesViewController: UIViewController {
    //MARK: - Properties
    var viewModel = CountriesViewModel()
    
    private lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "გამარჯობა", message: "თქვენ პირველად დალოგინდით გისურვებთ სასიამოვნო გამოცდილებას!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "მადლობა", style: .default, handler: nil)
        alert.addAction(okAction)
        return alert
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Countries"
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //ხაზები რომ არ გამოჩნდეს
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.barTintColor = UIColor(named: "Background Color")
        return searchBar
    }()
    
    private lazy var countriesTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableHeaderView = headerLabel
        tableview.backgroundColor = .clear
        return tableview
    }()

    private lazy var searchBarAndTitleStackView: UIStackView = {
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
    
    private lazy var wholeStackView: UIStackView = {
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
    
    var onCountriesFiltered:((String) -> Void)?
    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad(view: self)
        reloadData()
        navigateToDetails()
        presentAlert()
        setUpUI()
    }
    
    //MARK: - Helper Methods
    private func setUpUI(){
        view.backgroundColor = UIColor(named: "Background Color")
        constrainWholeStackView()
        configureCountriesTableView()
        constrainSearchBar()
        constrainHeaderLabel()
    }
    
    private func configureCountriesTableView() {
        NSLayoutConstraint.activate([
            countriesTableView.trailingAnchor.constraint(equalTo: wholeStackView.trailingAnchor, constant: -15),
            countriesTableView.leadingAnchor.constraint(equalTo: wholeStackView.leadingAnchor, constant: 15)
        ])
        countriesTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
        
        countriesTableView.separatorStyle = .none
    }
    
    private func constrainSearchBar() {
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalToConstant: 35),
            searchBar.widthAnchor.constraint(equalTo: wholeStackView.widthAnchor),
            searchBar.centerXAnchor.constraint(equalTo: wholeStackView.centerXAnchor)
        ])
    }
    
    private func constrainWholeStackView() {
        view.addSubview(wholeStackView)
        NSLayoutConstraint.activate([
            wholeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wholeStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            wholeStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            wholeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    private func constrainHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: wholeStackView.leadingAnchor, constant: 15)
        ])
    }
    
    private func reloadData() {
        viewModel.onCountryUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.countriesTableView.reloadData()
            }
        }
    }
    
    private func navigateToDetails() {
        viewModel.onCountriesSelected = { [weak self] country in
            let countryDetailsViewModel = CountryDetailsViewModel(country: country)
            let countryDetailsViewController = DetailsPageViewController(viewModel: countryDetailsViewModel)
            self?.navigationController?.pushViewController(countryDetailsViewController, animated: false)
        }
    }
    
    private func presentAlert() {
        if viewModel.firstLoggedIn {
            present(alert, animated: true, completion: nil)
        }
    }
}



