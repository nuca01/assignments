//
//  NewsCell.swift
//  assignment19
//
//  Created by nuca on 19.04.24.
//

import UIKit

class NewsCell: UITableViewCell {
    //MARK: - Properties
    static let identifier = "NewsCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.white
        //მთელი ტექსტი იქნება მეორე გვერდზე და აქ მხოლოდ დასაწყისი
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var labelsStackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [timeLabel,
         titleLabel
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    //MARK: - Initilizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Methods
    func setUpUI() {
        addAndConstrainBackgroundImage()
        addAndConstrainLabelsStackView()
        constrainTimeLabel()
        constrainTitleLabel()
    }
    
    func addAndConstrainBackgroundImage() {
        contentView.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalToConstant: 108),
            backgroundImage.widthAnchor.constraint(equalToConstant: self.bounds.width),
            backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func constrainTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 303)
        ])
    }
    
    func constrainTimeLabel() {
        NSLayoutConstraint.activate([
            timeLabel.heightAnchor.constraint(equalToConstant: 14),
            timeLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addAndConstrainLabelsStackView(){
        contentView.addSubview(labelsStackview)
        NSLayoutConstraint.activate([
            labelsStackview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelsStackview.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func updateCell(with news: News) {
        titleLabel.text = news.title
        timeLabel.text = news.time
        ImageService.imageService.loadImageFromURL(news.photoUrl){ image in
            if let image = image {
                self.backgroundImage.image = image
            } else {
                self.backgroundColor = .black
            }
        }
    }
}
