//
//  DetailsPageController.swift
//  assignment19
//
//  Created by nuca on 19.04.24.
//

import UIKit

class DetailsPageViewController: UIViewController {
    //MARK: - Properties
    lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Details"
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView =  UITextView()
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.isEditable = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        return textView
    }()
    
    lazy var detailsAndImageStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [detailsLabel,
         image
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var labelsAndImageStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .trailing
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [detailsAndImageStackview,
         timeLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var wholeStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [detailsAndImageStackview,
         descriptionTextView
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    //MARK: - Helper Methods
    func setUpUI(){
        addAndConstrainWholeStackView()
        constrainDetailsLabel()
        constrainTimeLabel()
        constrainImage()
    }
    
    func addAndConstrainWholeStackView() {
        view.addSubview(wholeStackview)
        NSLayoutConstraint.activate([
            wholeStackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wholeStackview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            wholeStackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            wholeStackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
    }
    
    func constrainDetailsLabel() {
        NSLayoutConstraint.activate([
            detailsLabel.heightAnchor.constraint(equalToConstant: 31),
            detailsLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func constrainTimeLabel() {
        NSLayoutConstraint.activate([
            timeLabel.heightAnchor.constraint(equalToConstant: 19),
            timeLabel.widthAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    func constrainImage() {
        NSLayoutConstraint.activate([
            timeLabel.heightAnchor.constraint(equalToConstant: 190),
            timeLabel.widthAnchor.constraint(equalToConstant: 327)
        ])
    }
    
    func constrainDescriptionTextView() {
        NSLayoutConstraint.activate([
            timeLabel.widthAnchor.constraint(equalToConstant: 303)
        ])
    }
}
