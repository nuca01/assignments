//
//  CountriesViewController.swift
//  assignment20
//
//  Created by nuca on 22.04.24.
//

import UIKit

class CountriesViewController: UIViewController {
    //MARK: - Properties
    let urlString = "https://restcountries.com/v3.1/all"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Countries"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var countriesTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableHeaderView = headerLabel
        return tableview
    }()
    
    var countriesArray = [Country]()
    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setUpUI()
    }
    
    //MARK: - Helper Methods
    func setUpUI(){
        view.backgroundColor = .white
        configureCountriesTableView()
    }
    
    func configureCountriesTableView() {
        view.addSubview(countriesTableView)
        
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            countriesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            countriesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        
        countriesTableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        
        countriesTableView.separatorStyle = .none
    }
    
    func getData() {
        NetworkService.networkService.getData(urlString: urlString) { (result: Result<[Country], Error>) in
            switch result {
            case .success(let success):
                self.countriesArray = success
                self.countriesTableView.reloadData()
            case .failure(let failure):
                //ერორის პრინტვა
                print(failure.localizedDescription)
            }
        }
    }
}



