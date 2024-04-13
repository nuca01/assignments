import UIKit

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        27
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return lettersAndItems[Character(UnicodeScalar(section + 64)!)]!.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 28.5))
            let label = UILabel(frame: CGRect(x: 19, y: 0, width: tableView.frame.width - tableView.contentInset.left, height: 28.5))
            label.text = "\(Character(UnicodeScalar(section+64)!))"
            label.font = UIFont(name: "systemFont", size: 15)
            label.textAlignment = .left
            label.textColor = .gray
            view.addSubview(label)
            return view
        } else {
            return nil
        }
    }
    private func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> Character? {
        if section == 0 {
            return nil
        } else {
            return Character(UnicodeScalar(section + 64)!)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainPersonCell") as! MainPersonCell
            cell.updateCell(with: person)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! PersonCell
            let currentPerson = lettersAndItems[(Character(UnicodeScalar(indexPath.section + 64)!))]![indexPath.row]
            cell.updateCell(with: currentPerson)
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 72
        } else {
            return 44.5
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = DetailsPageViewController()
        if (indexPath.section == 0) {
            nextViewController.person = person
        } else {
            nextViewController.person = lettersAndItems[Character(UnicodeScalar(indexPath.section + 64)!)]![indexPath.row]
        }
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
