//
//  MainPageViewController+TableView.swift
//  assignment23
//
//  Created by nuca on 03.05.24.
//

import UIKit

extension MainPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate.factsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FactsCell.identifier) as! FactsCell
        let currentItem = delegate.getFactFor(index: indexPath.row)
        cell.updateCell(with: currentItem.fact)
        return cell
    }
}

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
