import UIKit

class DetailsPageViewController: UIViewController {
    var person: Person?
    lazy var graySquare: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "\(person!.Image)")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 91.5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var label: UILabel = {
        var label = UILabel()
        label.text = "\(person!.name) \(person!.surname)"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        //tableView.layer.cornerRadius = 10
        //tableView.clipsToBounds = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GenderCell.self, forCellReuseIdentifier: "Gender Cell")
        tableView.register(AgeCell.self, forCellReuseIdentifier: "Age Cell")
        tableView.register(HobbyCell.self, forCellReuseIdentifier: "Hobby Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    lazy var imageAndLabelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [imageView,
         label
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        addAndConstrainGraySquare()
        addAndConstrainimageAndLabelStackView()
        addAndConstrainImageView()
        addAndConstrainLabel()
        addConstraintsToTableView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 10
    }
    
    func addAndConstrainImageView() {
        imageView.addViewConstraints(
            height: 183,
            width: 183
        )
    }
    func addAndConstrainimageAndLabelStackView() {
        view.addSubview(imageAndLabelStackView)
        imageView.addViewConstraints(
            height: 211,
            width: 183,
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 125,
            centerXAnchorEqualTo: graySquare.centerXAnchor
        )
        tableView.layer.masksToBounds = true
    }
    func addAndConstrainGraySquare() {
        view.addSubview(graySquare)
        graySquare.addViewConstraints(
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 0,
            bottomAnchorSeparationInRespectTo: view.topAnchor,
            bottomAnchorSeparationConstant: 350,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 0,
            trailingAnchorSeparationInRespectTo: view.trailingAnchor,
            trailingAnchorSeparationConstant: 0,
            centerXAnchorEqualTo: view.centerXAnchor
        )
    }
    func addAndConstrainLabel() {
        graySquare.addViewConstraints(
            height: 28,
            width: 183
        )
    }
    func addConstraintsToTableView(){
        view.addSubview(tableView)
        tableView.addViewConstraints(
            width: UIScreen.main.bounds.width - 40,
            topAnchorSeparationInRespectTo: view.topAnchor,
            topAnchorSeparationConstant: 360,
            centerXAnchorEqualTo: view.centerXAnchor
        )
        adjustTableViewHeight()
    }
}
