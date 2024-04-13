//
//  ViewController.swift
//  assignment16
//
//  Created by nuca on 12.04.24.
//

import UIKit

class ViewController: UIViewController {
    lazy var safeAreaInsents: UIEdgeInsets? = {
        var insents: UIEdgeInsets?
        if #available(iOS 11.0, *) {
            insents = view.safeAreaInsets
        }
        return insents
    }()
    lazy var listNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "  iOS Squad"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var itemsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    lazy var nameLabelAndItemsTableViewStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [listNameLabel,
         itemsTableView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    lazy var lettersStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4.0
        stack.alignment = .trailing
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        for scalarValue in UnicodeScalar("A").value...UnicodeScalar("Z").value {
            let button = getLetterButton(letter: Character(UnicodeScalar(scalarValue)!))
            [button].forEach { stack.addArrangedSubview($0) }
            button.addViewConstraints(
                height: 13
            )
        }
        return stack
    }()
    lazy var wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 1.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [nameLabelAndItemsTableViewStackView,
         lettersStackView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var person: Person = {
        let person = Person(name: "Nuca", surname: "Beriashvili", hobby: "Archery", age: 19, Image: "Intimidating Brunnete Girl", gender: .Female)
        return person
    }()
    lazy var persons: [Person] = {
        let array = [
            Person(name: "nodar", surname: "ghachava", hobby: "running", age: 20, Image: "Brunnete Guy", gender: .Male),
            Person(name: "elene", surname: "donadze", hobby: "climbimg", age: 19, Image: "Intimidating Brunnete Girl", gender: .Female),
            Person(name: "temuri", surname: "chitashvili", hobby: "painting", age: 19, Image: "Brunnete Guy", gender: .Male),
            Person(name: "irina", surname: "datoshvili", hobby: "diving", age: 22, Image: "Intimidating Brunnete Girl", gender: .Female),
            Person(name: "tornike", surname: "elqanashvili", hobby: "singing", age: 23, Image: "Brunnete Guy", gender: .Male),
            Person(name: "ana", surname: "ioramashvili", hobby: "sewing", age: 20, Image: "Blondie"
                   , gender: .Female),
            Person(name: "nini", surname: "bardavelidze", hobby: "pilates", age: 18, Image: "Brunnete Girl With Berret", gender: .Female),
            Person(name: "barbare", surname: "tepnadze", hobby: "watching movies", age: 20, Image: "Brunnete Girl With Berret", gender: .Female),
            Person(name: "mariam", surname: "sreseli", hobby: "karate", age: 24, Image: "Brunnete Girl With Berret", gender: .Female),
            Person(name: "valeri", surname: "mekhashishvili", hobby: "playing board games", age: 22, Image: "Brunnete Guy", gender: .Male),
            Person(name: "zuka", surname: "papuashvili", hobby: "writing", age: 21, Image: "Brunnete Guy", gender: .Male),
            Person(name: "luka", surname: "kharatishvili", hobby: "football", age: 20, Image: "Brunnete Guy", gender: .Male),
            Person(name: "data", surname: "robakidze", hobby: "basketball", age: 26, Image: "Brunnete Guy", gender: .Male),
            Person(name: "nik’a", surname: "kakhniashvili", hobby: "brewing", age: 19, Image: "Brunnete Guy", gender: .Male),
            Person(name: "sandro", surname: "gelashvili", hobby: "fencing", age: 21, Image: "Brunnete Guy", gender: .Male),
            Person(name: "ana", surname: "namgaladze", hobby: "drawing", age: 20, Image: "Brunnete Girl With Berret", gender: .Female),
            Person(name: "bakar", surname: "kharabadze", hobby: "cooking", age: 20, Image: "Brunnete Guy", gender: .Male),
            Person(name: "archil", surname: "menabde", hobby: "fishing", age: 25, Image: "Happy Blonde Guy", gender: .Male),
            Person(name: "tamuna", surname: "kakhidze", hobby: "gardening", age: 26, Image: "Brunnete Girl With Berret", gender: .Female),
            Person(name: "giorgi", surname: "michitashvili", hobby: "reading", age: 19, Image: "Brunnete Guy", gender: .Male),
            Person(name: "salome", surname: "topuria", hobby: "tennis", age: 24, Image: "Brunnete Girl With Berret", gender: .Female),
            Person(name: "luka", surname: "gujejiani", hobby: "swimming", age: 21, Image: "Brunnete Guy", gender: .Male),
            Person(name: "gega", surname: "tatulishvili", hobby: "travelling", age: 21, Image: "Brunnete Guy", gender: .Male),
            Person(name: "raisa", surname: "badalova", hobby: "piano", age: 20, Image: "Intimidating Brunnete Girl", gender: .Female),
            Person(name: "aleksandre", surname: "saroiani", hobby: "boxing", age: 23, Image: "Happy Blonde Guy", gender: .Male),
            Person(name: "begi", surname: "kopaliani", hobby: "bouldering", age: 19, Image: "Brunnete Guy", gender: .Male),
            Person(name: "akaki", surname: "titberidze", hobby: "teaching", age: 25, Image: "Brunnete Guy", gender: .Male),
            Person(name: "sandro", surname: "kupatadze", hobby: "skating", age: 22, Image: "Happy Blonde Guy", gender: .Male),
            Person(name: "gvantsa", surname: "gvagvalia", hobby: "biking", age: 22, Image: "Intimidating Brunnete Girl", gender: .Female),
            Person(name: "vano", surname: "kvakhadze", hobby: "rugby", age: 24, Image: "Brunnete Guy", gender: .Male),
            Person(name: "vaso", surname: "baramidze", hobby: "basketball", age: 17, Image: "Brunnete Guy", gender: .Male),
            Person(name: "davit", surname: "natenadze", hobby: "singing", age: 75, Image: "Bearded Guy", gender: .Male),
            Person(name: "beqa-Giorgi", surname: "tabunidze", hobby: "stand-up comedian", age: 80, Image: "Brunnete Guy", gender: .Male)
            ]
        return array.sorted()
    }()
    lazy var lettersAndItems: [Character: [Person]] = {
        var dictionary: [Character: [Person]] = [:]
        for scalarValue in UnicodeScalar("A").value...UnicodeScalar("Z").value {
            if let character = UnicodeScalar(scalarValue) {
                dictionary[Character(character)] = []
            }
        }
        for person in persons {
            let firstLetter = person.name.first!.uppercased() 
            dictionary[Character(firstLetter), default: []].append(person)
        }
        return dictionary
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        addNameLabelAndItemsTableViewStackView()
        addAndConstrainWholeStackView()
        addConstraintsToListNameLabel()
        addConstraintsToItemsTableView()
        itemsTableView.register(MainPersonCell.self, forCellReuseIdentifier: "MainPersonCell")
        itemsTableView.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
//        addConstraintsToLettersStackView()
        
    }
    

    func addConstraintsToListNameLabel() {
        listNameLabel.addViewConstraints(
            height: 41
        )
    }
    func addConstraintsToLettersStackView() {
        listNameLabel.addViewConstraints(
            height: 403,
            centerYAnchorEqualTo: wholeStackView.centerYAnchor
        )
    }
    func addConstraintsToItemsTableView() {
        itemsTableView.addViewConstraints(
            height: UIScreen.main.bounds.size.height - (safeAreaInsents!.top + 41 + 10 + safeAreaInsents!.bottom),
            width: UIScreen.main.bounds.size.width - (safeAreaInsents!.left + 30 + safeAreaInsents!.right)
        )
    }
    func addConstraintsToNameLabelAndItemsTableViewStackView() {
        nameLabelAndItemsTableViewStackView.addViewConstraints(
        )
    }
    func addAndConstrainWholeStackView() {
        view.addSubview(wholeStackView)
        wholeStackView.addViewConstraints(
            topAnchorSeparationInRespectTo: view.safeAreaLayoutGuide.topAnchor,
            topAnchorSeparationConstant: 10,
            bottomAnchorSeparationInRespectTo: view.safeAreaLayoutGuide.bottomAnchor,
            bottomAnchorSeparationConstant: 0,
            leadingAnchorSeparationInRespectTo: view.leadingAnchor,
            leadingAnchorSeparationConstant: 0,
            trailingAnchorSeparationInRespectTo: view.safeAreaLayoutGuide.trailingAnchor,
            trailingAnchorSeparationConstant: -1
        )
    }
    func getLetterButton(letter: Character) -> UIButton {
        let button = UIButton()
        button.setTitle(String(letter), for: .normal)
        button.titleLabel?.font = UIFont(name: "Sylfaen", size: 11)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    @objc func buttonPressed(_ sender: UIButton) {
        if let letter = sender.title(for: .normal) {
            pressed(letter: Character(letter))
        }
    }
    func pressed(letter: Character) {
        let indexPath = IndexPath(row: NSNotFound, section: Int(letter.asciiValue!) - 64)
        self.itemsTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
}

