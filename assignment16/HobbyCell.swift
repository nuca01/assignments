import UIKit

class HobbyCell: UITableViewCell {
    
    lazy var rightTextLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    var person: Person?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addPersonsImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPersonsImageView() {
        contentView.addSubview(rightTextLabel)
        rightTextLabel.addViewConstraints(
            height: 22,
            width: 100,
            trailingAnchorSeparationInRespectTo: contentView.trailingAnchor,
            trailingAnchorSeparationConstant: -17,
            centerYAnchorEqualTo: contentView.centerYAnchor
        )
    }
    
    func updateCell(with person: Person) {
        textLabel?.text = "Hobby:"
        rightTextLabel.text = "\(person.hobby)"
        textLabel?.font = UIFont.systemFont(ofSize: 17)
        rightTextLabel.font = UIFont.systemFont(ofSize: 17)
    }
}
