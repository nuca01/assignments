import UIKit

class MainPersonCell: UITableViewCell {
    
    var personsImageView: UIImageView = UIImageView()
    var person: Person?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addPersonsImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPersonsImageView() {
        contentView.addSubview(personsImageView)
        personsImageView.translatesAutoresizingMaskIntoConstraints = false
        personsImageView.contentMode = .scaleAspectFill
        personsImageView.clipsToBounds = true
        personsImageView.layer.cornerRadius = 30
        personsImageView.addViewConstraints(
            height: 60,
            width: 60,
            leadingAnchorSeparationInRespectTo: contentView.leadingAnchor,
            leadingAnchorSeparationConstant: 18,
            centerYAnchorEqualTo: contentView.centerYAnchor
        )
    }
    
    func updateCell(with person: Person) {
        textLabel?.text = "             \(person.name) \(person.surname)"
        textLabel?.font = UIFont.systemFont(ofSize: 22)
        personsImageView.image = UIImage(named: "\(person.Image)")
    }
}
