//
//  DetailsPageView.swift
//  assignment21
//
//  Created by nuca on 24.04.24.
//

import UIKit
class DetailsPageView: UIView {
    var delegate: DetailsPageViewModelDelegate?
    
    lazy var scrollViewWidth: CGFloat = {
        UIScreen.main.bounds.width - 40
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = delegate?.getOfficialName()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor.label
        label.numberOfLines = 0
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
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var aboutFlagLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = delegate?.getFlagsAlt()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var horizontalInformationStackViews = [
        generateHorizontalInformationStackView(with: "official name:", and: delegate!.getOfficialName()),
        generateHorizontalInformationStackView(with: "common name:", and: delegate!.getCommonName()),
        generateHorizontalInformationStackView(with: "independent:", and: delegate!.getIndependance()),
        generateHorizontalInformationStackView(with: "region:", and: delegate!.getRegion()),
        generateHorizontalInformationStackView(with: "area:", and: delegate!.getArea()),
        generateHorizontalInformationStackView(with: "start of week:", and: delegate!.getStartOfWeek()),
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
    
//    MARK: - Initializers
        override init(frame: CGRect) {
            super.init(frame: frame)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
//    MARK: - Functions
    func setUpUI() {
        backgroundColor = UIColor(named: "Background Color")
        configureFlagImage()
        constrainAboutFlagLabel()
        constrainInformationLabelsStackview()
        constrainScrollViewStackView()
        constrainScrollView()
        constrainCountryLabel()
    }
}
