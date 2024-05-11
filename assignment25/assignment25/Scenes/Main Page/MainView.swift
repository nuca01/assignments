//
//  MainView.swift
//  assignment25
//
//  Created by Nuca on 11.05.24.
//

import UIKit

protocol MainViewDelegate {
    
    func getSongTitle() -> String
    func getSongArtist() -> String
    func getSongLength() -> Double
    func getSongCoverImageName() -> String
    
}

class MainView: UIView {
    
    //MARK: - Properties
    private var delegate: MainViewDelegate?
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GradientBackground")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    lazy var addingButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.backgroundColor = UIColor(red: 0.0, green: 0.45, blue: 1, alpha: 1)
//        button.addAction(UIAction(handler: { _ in
//            self.pressed()
//        }), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    lazy var pauseImageView: UIImageView = {
        generatePlayPauseStackViewImage(of: "pause")
    }()
    
    lazy var playImageView: UIImageView = {
        generatePlayPauseStackViewImage(of: "play")
    }()
    
    var playPauseImageView: UIImageView?
    
    lazy var playPauseView: UIView = {
        let playPauseView = UIView()
        
        let ballImageView = generatePlayPauseStackViewImage(of: "ball")
        playPauseImageView = generatePlayPauseStackViewImage(of: "play")
        
        constrainPlayPauseStackViewItem(imageView: ballImageView, height: 150, width: 150)
        constrainPlayPauseStackViewItem(imageView: playPauseImageView!, height: 30, width: 30)
        
        playPauseView.addSubview(ballImageView)
        playPauseView.addSubview(playPauseImageView!)
        
        NSLayoutConstraint.activate([
            ballImageView.centerXAnchor.constraint(equalTo: playPauseView.centerXAnchor),
            playPauseImageView!.centerXAnchor.constraint(equalTo: playPauseView.centerXAnchor),
            ballImageView.centerYAnchor.constraint(equalTo: playPauseView.centerYAnchor),
            playPauseImageView!.centerYAnchor.constraint(equalTo: playPauseView.centerYAnchor),
        ])
        
        playPauseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnPause(_:))))
        
        return playPauseView
    }()
    
    lazy var playPauseStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            generatePlayPauseStackViewImage(of: "shuffle"),
            generatePlayPauseStackViewImage(of: "skip-back"),
        ].forEach {
            stack.addArrangedSubview($0)
            constrainPlayPauseStackViewItem(imageView: $0, height: 24, width: 24.59)
        }
        
        stack.addArrangedSubview(playPauseView)
        constrainPlayPauseStackViewItem(imageView: playPauseView, height: 45, width: 45)
        
        [
            generatePlayPauseStackViewImage(of: "skip-forward"),
            generatePlayPauseStackViewImage(of: "repeat"),
        ].forEach {
            stack.addArrangedSubview($0)
            constrainPlayPauseStackViewItem(imageView: $0, height: 24, width: 24.59)
        }
        
        return stack
    }()
    
    //MARK: - initialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpUI(){
        setBackgroundColor()
        configurePlayPauseStackView()
    }
    
    private func setBackgroundColor() {
        backgroundColor = .black
    }
    
    private func configurePlayPauseStackView() {
        addSubview(playPauseStackView)
        NSLayoutConstraint.activate([
            playPauseStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            playPauseStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            playPauseStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func generatePlayPauseStackViewImage(of imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func constrainPlayPauseStackViewItem(imageView: UIView, height: Double, width: Double) {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    @objc private func handleTapOnPause(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        var animator  = UIViewPropertyAnimator(duration: 1, dampingRatio: 0.7) { [weak self] in
            if self?.playPauseImageView?.image == self?.playImageView.image {
                self?.playPauseImageView?.image = self?.pauseImageView.image
            } else {
                self?.playPauseImageView?.image = self?.playImageView.image
            }
        }
        animator.startAnimation()
    }
}

//MARK: - MainViewControllerDelegate
extension MainView: MainViewControllerDelegate {
    
    //MARK: - LifeCycles
    func didLoad() {
        setUpUI()
    }
}
