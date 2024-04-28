//
//  DetailsViewController.swift
//  assignment20
//
//  Created by nuca on 22.04.24.
//

import UIKit

class DetailsPageViewController: UIViewController {
//    MARK: - Properties
    private let viewModel: CountryDetailsViewModel

    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = viewModel.commonCountryNameTitle
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var shadowView: UIView = {
        let outerView = UIView()
        outerView.backgroundColor = .clear
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOffset = .zero
        outerView.layer.shadowRadius = 2
        outerView.layer.shadowOpacity = 0.5
        outerView.layer.shadowOffset = CGSize(width: -1, height: 1)
        outerView.translatesAutoresizingMaskIntoConstraints = false
        return outerView
    }()
    
    lazy var flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.shadowColor = UIColor.label.cgColor
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var aboutFlagLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = viewModel.countryFlag
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var horizontalInformationStackViews = [
        generateHorizontalInformationStackView(with: "official name:", and: viewModel.officialCountryNameTitle),
        generateHorizontalInformationStackView(with: "common name:", and: viewModel.commonCountryNameTitle),
        generateHorizontalInformationStackView(with: "independent:", and: viewModel.countryIndependenceDescription),
        generateHorizontalInformationStackView(with: "region:", and: viewModel.countryRegion),
        generateHorizontalInformationStackView(with: "area:", and: viewModel.countryArea),
        generateHorizontalInformationStackView(with: "start of week:", and: viewModel.startOfTeWeek),
    ]
    
    lazy var informationLabelsStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        horizontalInformationStackViews.forEach {stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var titleLabels = [
        genetarteSemiTitleLabel(with: "About The Flag:"),
        genetarteSemiTitleLabel(with: "Basic information:"),
        genetarteSemiTitleLabel(with: "Useful links:")
    ]
    
    lazy var titleAndDescriptionStackViews = [
        generateTitleAndDescriptionStackview(with: titleLabels[0], and: aboutFlagLabel),
        generateTitleAndDescriptionStackview(with: titleLabels[1], and: informationLabelsStackview),
        generateTitleAndDescriptionStackview(with: titleLabels[2], and: mapsImagesStackview)
    ]
    
    lazy var scrollViewStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [countryLabel,
         shadowView
        ].forEach { stack.addArrangedSubview($0) }
        titleAndDescriptionStackViews.forEach { stack.addArrangedSubview($0) }
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
    
    //    MARK: - Initilizers
        init(viewModel: CountryDetailsViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadFlag()
        setUpUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for stack in horizontalInformationStackViews {
            stack.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 42).isActive = true
        }
    }
    //MARK: - Helper Methods
    func setUpUI(){
        view.backgroundColor = UIColor(named: "Background Color")
        loadFlag()
        configureFlagImage()
        constrainAboutFlagLabel()
        constrainInformationLabelsStackview()
        constrainScrollViewStackView()
        constrainScrollView()
        
    }
    
    func constrainAboutFlagLabel() {
        aboutFlagLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 42).isActive = true
    }
    
    func constrainInformationLabelsStackview() {
        informationLabelsStackview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 42).isActive = true
    }

    func constrainScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
    
    func constrainScrollViewStackView() {
        scrollView.addSubview(scrollViewStackview)
        NSLayoutConstraint.activate([
            scrollViewStackview.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1),
            scrollViewStackview.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),            scrollViewStackview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -1)
        ])
    }
    
    func configureFlagImage() {
        let widthACCordingToScreen = UIScreen.main.bounds.width - 40
        let heightAccordingToWidth = widthACCordingToScreen / 1.5
        NSLayoutConstraint.activate([
            shadowView.widthAnchor.constraint(equalToConstant: widthACCordingToScreen),
            shadowView.heightAnchor.constraint(equalToConstant: heightAccordingToWidth)
        ])
        shadowView.addSubview(flagImage)
        NSLayoutConstraint.activate([
            flagImage.widthAnchor.constraint(equalToConstant: widthACCordingToScreen),
            flagImage.heightAnchor.constraint(equalToConstant: heightAccordingToWidth),
            flagImage.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
            flagImage.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor),
        ])
    }
    
    func genetarteSemiTitleLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor.label
        label.text = text
        return label
    }
    
    func generateInformationLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.label
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func generateHorizontalInformationStackView(with explanation: String, and value: String) -> UIStackView {
        let explanationLabel = generateInformationLabel(with: explanation)
        explanationLabel.numberOfLines = 0
        let valueLabel = generateInformationLabel(with: value)
        valueLabel.numberOfLines = 0
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [explanationLabel,
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
        [title,
         description
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
    
    func generateMapsImage(with imageName: String, first: Bool) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.label.cgColor
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
    func loadFlag(){
        viewModel.onFetchImage = {[weak self] image in
            let image = UIImage(data: image)
            DispatchQueue.main.async {
                self?.flagImage.image = image
            }
        }
    }
    
//    MARK: - Button Methods
    @objc func firstImageTapped() {
        UIApplication.shared.open(viewModel.openStreetMapsUrl!, options: [:], completionHandler: nil)
    }
    
    @objc func secondImageTapped() {
        UIApplication.shared.open(viewModel.googleMapsUrl!, options: [:], completionHandler: nil)
    }
}
