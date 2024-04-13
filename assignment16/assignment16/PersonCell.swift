import UIKit

class PersonCell: UITableViewCell {
    var person: Person?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateCell(with person: Person) {
        self.person = person
        textLabel?.text = "\(person.name) \(person.surname)"
    }
}

