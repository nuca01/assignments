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
        label.font = UIFont(name: "FiraGO-Regular", size: 30)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setLineHeight(lineHeight: 48)
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
            instructionsLabel.heightAnchor.constraint(equalToConstant: 192),
            instructionsLabel.widthAnchor.constraint(equalToConstant: 263),
            instructionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            instructionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: spacingFromCenter)
        ])
    }
    
    func addAndConstrainStartButton(){
        //ფიგმას ზომების მიხედვით ეკრანის სიგრძეზე 16-ჯერ და სიგანეზე 3 ჯერ პატარაა
        let widthAccordingToCurrentScreen = screenSize.height / 16
        let heightAccordingToCurrentScreen = screenSize.width / 3
        //ეკრანის ზომის 80%ით არის დაშორებული ზედა საზღვრიდან
        let spacingFromTopAccordingToScreenSize = screenSize.height * 0.8
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: widthAccordingToCurrentScreen),
            startButton.widthAnchor.constraint(equalToConstant: heightAccordingToCurrentScreen),
            startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: spacingFromTopAccordingToScreenSize),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    func adjustStartButtonCorners(){
        startButton.layer.cornerRadius = startButton.bounds.height / 2
    }
    
    func adjustFontSize() {
        //ფიგმას ზომების მიხედვით ფონტის ზომა სიგანეზე 3.4ჯერ პატარაა
        let fontSizeaccordingToWidth = startButton.bounds.height / 3.4
        startButton.titleLabel?.font = UIFont(name: "FiraGO-Bold", size: fontSizeaccordingToWidth)
    }
    
    func pressed() {
        let nextViewController = MainPageController()
        disableGoingBack(for: nextViewController)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func disableGoingBack(for viewcontroller: UIViewController) {
        viewcontroller.navigationItem.hidesBackButton = true
        viewcontroller.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}

