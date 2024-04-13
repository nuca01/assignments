import UIKit
extension DetailsPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Gender Cell") as! GenderCell
            cell.updateCell(with: person!)
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Age Cell") as! AgeCell
            cell.updateCell(with: person!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Hobby Cell") as! HobbyCell
            cell.updateCell(with: person!)
            return cell
        }
    }
    func adjustTableViewHeight() {
        let cell = HobbyCell()
        tableView.heightAnchor.constraint(equalToConstant: cell.bounds.height * 3).isActive = true
    }
}
