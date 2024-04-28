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
    
    lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "გამარჯობა", message: "თქვენ პირველად დალოგინდით გისურვებთ სასიამოვნო გამოცდილებას!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "მადლობა", style: .default, handler: nil)
        alert.addAction(okAction)
        return alert
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Countries"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countriesTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableHeaderView = headerLabel
        return tableview
    }()

    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad()
        reloadData()
        navigateToDetails()
        presentAlert()
        setUpUI()
    }
    
    //MARK: - Helper Methods
    private func setUpUI(){
        view.backgroundColor = .white
        configureCountriesTableView()
    }
    
    private func configureCountriesTableView() {
        view.addSubview(countriesTableView)
        
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            countriesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            countriesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        countriesTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
        
        countriesTableView.separatorStyle = .none
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



