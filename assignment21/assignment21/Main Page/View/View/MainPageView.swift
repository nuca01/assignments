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
}
class MainPageView: UIView {
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
    
    lazy var countriesTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableHeaderView = headerLabel
        tableview.backgroundColor = .clear
        return tableview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI(){
        delegate!.getData()
        backgroundColor = UIColor(named: "Background Color")
        configureCountriesTableView()
    }
}
