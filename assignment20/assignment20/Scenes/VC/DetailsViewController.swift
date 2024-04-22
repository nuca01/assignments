//
//  DetailsViewController.swift
//  assignment20
//
//  Created by nuca on 22.04.24.
//

import UIKit

class DetailsPageViewController: UIViewController {
    //MARK: - Properties
    var country: Country?
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = country?.name?.official ?? "not available"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.black.cgColor
        return imageView
    }()
    
    lazy var aboutFlagLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = country?.flags?.alt ?? "not available"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var informationLabelsStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [generateHorizontalInformationStackView(with: "official name:", and: country?.name?.official ?? "unavailable"),
         generateHorizontalInformationStackView(with: "common name:", and: country?.name?.common ?? "unavailable"),
         generateHorizontalInformationStackView(with: "independent:", and: country?.independent?.description ?? "unavailable"),
         generateHorizontalInformationStackView(with: "region:", and: country?.region ?? "unavailable"),
         generateHorizontalInformationStackView(with: "area:", and: String(country?.area ?? 0)),
         generateHorizontalInformationStackView(with: "start of week:", and: country?.startOfWeek ?? "unavailable"),
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var scrollViewStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .trailing
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [generateTitleAndDescriptionStackview(with: genetarteSemiTitleLabel(with: "About The Flag:"), and: aboutFlagLabel),
         generateTitleAndDescriptionStackview(with: genetarteSemiTitleLabel(with: "Basic information:"), and: informationLabelsStackview),
         generateTitleAndDescriptionStackview(with: genetarteSemiTitleLabel(with: "Useful links:"), and: mapsImagesStackview)
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var mapsImagesStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 60.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [generateMapsImage(with: "Openstreetmap_logo 1", first: true),
         generateMapsImage(with: "Google_Maps_icon_(2020) 1", first: false)
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var wholeStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [countryLabel,
         flagImage,
         scrollView
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
        view.backgroundColor = .white
        configureFlagImage()
        constrainAboutFlagLabel()
        constrainInformationLabelsStackview()
        constrainScrollViewStackview()
        constrainScrollView()
        addAndConstrainWholeStackView()
    }
    
    func addAndConstrainWholeStackView() {
        view.addSubview(wholeStackview)
        NSLayoutConstraint.activate([
            wholeStackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wholeStackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            wholeStackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            wholeStackview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    func constrainAboutFlagLabel() {
        aboutFlagLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 15).isActive = true
    }
    
    func constrainInformationLabelsStackview() {
        informationLabelsStackview.widthAnchor.constraint(equalToConstant: view.bounds.width - 15).isActive = true
    }
    
    func constrainScrollViewStackview() {
        scrollViewStackview.widthAnchor.constraint(equalToConstant: view.bounds.width - 15).isActive = true
    }
    
    func constrainScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewStackview)
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalToConstant: scrollViewStackview.bounds.width),
            scrollView.heightAnchor.constraint(equalToConstant: scrollViewStackview.bounds.height)
        ])
    }
    
    func configureFlagImage() {
        var widthACCordingToScreen = view.bounds.width - 10
        var heightAccordingToWidth = widthACCordingToScreen / 1.5
        NSLayoutConstraint.activate([
            flagImage.widthAnchor.constraint(equalToConstant: widthACCordingToScreen),
            flagImage.heightAnchor.constraint(equalToConstant: heightAccordingToWidth)
        ])
        flagImage.layer.cornerRadius = 20
        flagImage.layer.masksToBounds = true
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        flagImage.layer.shadowColor = UIColor.black.cgColor
        flagImage.layer.shadowOpacity = 0.5
        flagImage.layer.shadowOffset = CGSize(width: 0, height: 4)
        flagImage.layer.shadowRadius = 4
        flagImage.layer.masksToBounds = false
    }
    
    func genetarteSemiTitleLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor.black
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func generateInformationLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.black
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func generateHorizontalInformationStackView(with explanation: String, and value: String) -> UIStackView {
        var separatorView = UIView()
        separatorView.backgroundColor = .clear
        var explanationLabel = generateInformationLabel(with: explanation)
        var valueLabel = generateInformationLabel(with: value)
        let constraint = separatorView.widthAnchor.constraint(equalToConstant: view.bounds.width)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(1)
        separatorView.heightAnchor.constraint(equalToConstant: valueLabel.bounds.width).isActive = true
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [explanationLabel,
         separatorView,
         valueLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
    
    func generateTitleAndDescriptionStackview(with title: UILabel, and description: UIView) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [title,
         description
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
    
    func generateMapsImage(with imageName: String, first: Bool) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: imageName)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        var tapGesture: UITapGestureRecognizer
        if first {
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(firstImageTapped))
        } else {
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(secondImageTapped))
        }
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        return imageView
    }
    
    @objc func firstImageTapped() {
        guard let url = URL(string: country?.maps?.openStreetMaps ?? "google.com") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @objc func secondImageTapped() {
        guard let url = URL(string: country?.maps?.googleMaps ?? "google.com") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
