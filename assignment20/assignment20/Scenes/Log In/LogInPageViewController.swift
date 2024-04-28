//
//  LogInPage.swift
//  assignment20
//
//  Created by nuca on 28.04.24.
//
import UIKit
class LogInPageViewController: UIViewController {
    //    MARK: - Properties
    var viewModel = LogInPageViewModel()
    
    lazy var accountImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 132 / 2
        return imageView
    }()
    
    lazy var textfields = [
        generateTextFields(with: "შეიყვანეთ მომხმარებლის სახელი"),
        generateTextFields(with: "შეიყვანეთ პაროლი"),
        generateTextFields(with: "განმეორებით შეიყვანეთ პაროლი")
    ]
    
    lazy var textfieldLabels = [
        generateTextFieldLabels(with: "მომხმარებლის სახელი"),
        generateTextFieldLabels(with: "პაროლი"),
        generateTextFieldLabels(with: "გაიმეორეთ პაროლი")
    ]
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("შესვლა", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.setTitleColor(UIColor(named: "Background Color"), for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.addAction(UIAction(handler: { _ in
            self.logIn()
        }), for: .touchUpInside)
        button.layer.cornerRadius = 22.5
        return button
    }()
    
    lazy var middleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        for index in stride(from: 0, to: 3, by: 1) {
            stack.addArrangedSubview(generateLabelAndTextFieldStackView(forIndex: index))
        }
        return stack
    }()
    
    lazy var wholeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 50.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [accountImage,
         middleStackView,
         logInButton
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    var dynamicColor: UIColor {
        UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor.darkGray
            } else {
                return UIColor.systemGray6
            }
        }
    }
    
    var onDataLoaded: ((Data) -> Void)?
    var onCheckedIfLoggedIn: (() -> (String, String))?
    
    //    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        viewModel.didLoad(view: self)
        setTextFieldTexts()
        NotificationCenter.default.addObserver(self, selector: #selector(changeTetfieldColors), name: UIAccessibility.darkerSystemColorsStatusDidChangeNotification, object: nil)
    }
    
    //    MARK: - Methods
    private func generateTextFields(with placeholder: String) -> UITextField {
        let textField =  UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11)
        ]
        let attributedPlaceholder = NSAttributedString(string: "   \(placeholder)", attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        textField.font = UIFont.systemFont(ofSize: 11)
        textField.textColor = .systemGray
        textField.tintColor = .systemGray
        textField.layer.backgroundColor = UIColor.systemGray6.cgColor
        textField.layer.cornerRadius = 22
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func generateTextFieldLabels(with text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.text = text
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func generateLabelAndTextFieldStackView(forIndex: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2.0
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        [textfieldLabels[forIndex],
         textfields[forIndex]
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }
    
    private func setUpUI(){
        view.backgroundColor = UIColor(named: "Background Color")
        configureImage()
        constrainTextfields()
        constrainMiddleStackView()
        addAndConstrainWholeStackView()
        constrainLogInButton()
    }
    
    private func constrainAccountImage(){
        NSLayoutConstraint.activate([
            accountImage.heightAnchor.constraint(equalToConstant: 132),
            accountImage.widthAnchor.constraint(equalToConstant: 132)
        ])
    }
    
    private func configureImage() {
        setImage()
        setUpTapOnImage()
        constrainAccountImage()
    }
    
    private func setUpTapOnImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        accountImage.addGestureRecognizer(tapGesture)
        accountImage.isUserInteractionEnabled = true
        saveImageToDocumentsDirectory(image: accountImage.image ?? UIImage())
    }
    
    private func setImage() {
        viewModel.onFetchImage = { [weak self] url in
            do {
                let imageData = try Data(contentsOf: url)
                self?.accountImage.image = UIImage(data: imageData)
            } catch {
                self?.accountImage.image = UIImage(named: "AccountImage")
            }
        }
    }
    
    private func constrainTextfields() {
        for index in stride(from: 0, to: 3, by: 1) {
            constrainTextField(textField: textfields[index])
        }
    }
    
    private func constrainTextField(textField: UITextField) {
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func constrainMiddleStackView() {
        NSLayoutConstraint.activate([
            middleStackView.leadingAnchor.constraint(equalTo: wholeStackView.leadingAnchor),
            middleStackView.trailingAnchor.constraint(equalTo: wholeStackView.trailingAnchor)
        ])
    }
    
    private func constrainLogInButton() {
        NSLayoutConstraint.activate([
            logInButton.heightAnchor.constraint(equalToConstant: 45),
            logInButton.trailingAnchor.constraint(equalTo: middleStackView.trailingAnchor),
            logInButton.leadingAnchor.constraint(equalTo: middleStackView.leadingAnchor)
        ])
    }
    
    private func addAndConstrainWholeStackView() {
        view.addSubview(wholeStackView)
        NSLayoutConstraint.activate([
            wholeStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wholeStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            wholeStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func logIn() {
        viewModel.didCheckAccount = { [weak self] in
            guard let text0 = self?.textfields[0].text,
                  let text1 = self?.textfields[1].text,
                  let text2 = self?.textfields[2].text
            else {
                return (nil, nil)
            }
            if text1 == text2 {
                return (text0, text1)
            }
            return (nil, nil)
        }
        viewModel.checkIfAccountExists()
    }
    
    func setTextFieldTexts() {
        viewModel.onButtonTapped = { [weak self] in
            let countriesViewController = CountriesViewController()
            self?.navigationController?.pushViewController(countriesViewController, animated: true)
        }
        let account = onCheckedIfLoggedIn?()
        textfields[0].text = account?.0
        textfields[1].text = account?.1
        textfields[2].text = account?.1
    }

    @objc func changeTetfieldColors() {
        for index in stride(from: 0, to: 3, by: 1) {
            textfields[index].backgroundColor = dynamicColor
        }
    }
    
    @objc func imageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}
