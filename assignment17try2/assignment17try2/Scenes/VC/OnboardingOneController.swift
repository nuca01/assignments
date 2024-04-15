//
//  OnboardingOneController.swift
//  assignment17try2
//
//  Created by nuca on 13.04.24.
//
import UIKit

class OnboardingOneController: UIViewController {
//MARK: - Properties
    let screenSize = UIScreen.main.bounds.size
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardingController1Background")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //სტატუს ბარის დასაფარად
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "შედი\nაპლიკაციაში\nდა იწუწუნე\nრამდენიც გინდა"
        label.numberOfLines = 4
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("დაწყება", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.45, blue: 1, alpha: 1)
        button.addAction(UIAction(handler: { _ in
            self.pressed()
        }), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //სტატუს ბარის დაფარვა, ფიგმაში ასე
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustStartButtonCorners()
        adjustFontSize()
    }
    
//MARK: - Helper Methods
    func setUpUI(){
        addAndConstrainBackground()
        addAndConstrainInstructionsLabel()
        addAndConstrainStartButton()
    }
    
    func addAndConstrainBackground() {
        view.addSubview(backgroundImage)
        // +20 რადგან მინდა ეკრანის სიგანეზე ოდნავ დიდი იყოს როგორც ფიგმაში
        let widthAccordingToCurrentScreen = screenSize.width + 20
        // ფარდობა ფოტოს სიგრძე და სიგანესი არის 2.16
        let heightAccordingToCurrentScreen = widthAccordingToCurrentScreen * 2.16
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalToConstant: heightAccordingToCurrentScreen),
            backgroundImage.widthAnchor.constraint(equalToConstant: widthAccordingToCurrentScreen),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func addAndConstrainInstructionsLabel() {
        view.addSubview(instructionsLabel)
        //ცენტრიდან ოდნავ ჩამოწეული დაბლა ეკრანის ზომის მიხედვით
        let spacingFromCenter = view.bounds.height / 10
        NSLayoutConstraint.activate([
            instructionsLabel.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenHeightOf(figmaSize: 192)),
            instructionsLabel.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 270)),
            instructionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            instructionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: spacingFromCenter)
        ])
    }
    
    func addAndConstrainStartButton(){
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenHeightOf(figmaSize: 48)),
            startButton.widthAnchor.constraint(equalToConstant: scaledSizeAccordingToScreenWidthOf(figmaSize: 123)),
            startButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: scaledSizeAccordingToScreenHeightOf(figmaSize: 660)
            ),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    func adjustStartButtonCorners(){
        startButton.layer.cornerRadius = startButton.bounds.height / 2
    }
    
    func adjustFontSize() {
        //ფიგმას ზომების მიხედვით ფონტის ზომა სიზგრძეზე (48/14)-ჯერ პატარაა
        let fontSizeOfButtonccordingToHeight = startButton.bounds.height / (48/14)
        startButton.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: fontSizeOfButtonccordingToHeight)
        let fontSizeOfLabelAccordingToHeight = instructionsLabel.bounds.height / (192/30)
        instructionsLabel.font = UIFont(name: "FiraGO-Regular", size: fontSizeOfLabelAccordingToHeight)
        let lineHeightAccordingToHeight = instructionsLabel.bounds.height / (192/48)
        instructionsLabel.setLineHeight(lineHeight: lineHeightAccordingToHeight)
    }
    
    func pressed() {
        let nextViewController = MainPageController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

