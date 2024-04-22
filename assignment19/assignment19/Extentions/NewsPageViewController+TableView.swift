//
//  NewsPageController+TableView.swift
//  assignment19
//
//  Created by nuca on 19.04.24.
//

import UIKit

extension NewsPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier) as! NewsCell
        let currentNews = newsArray[indexPath.row]
        cell.updateCell(with: currentNews)
        return cell
    }
}

extension NewsPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = DetailsPageViewController()
        //cell-იდან ინფორმაციის ამოღება და შემდეგი კონტროლერისთვის გადაწოდება
        if let cell = tableView.cellForRow(at: indexPath) as? NewsCell {
            nextViewController.image.image = cell.backgroundImage.image
            nextViewController.timeLabel.text = cell.timeLabel.text
            nextViewController.descriptionTextView.text = cell.titleLabel.text
        }
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
