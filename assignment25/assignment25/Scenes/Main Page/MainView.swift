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

final class MainView: UIView {
    
    //MARK: - Properties
    private var delegate: MainViewDelegate?
    
    private lazy var songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Never Gonna Give You Up")
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - PlayPause
    
    private lazy var pauseImageView: UIImageView = {
        generatePlayPauseStackViewImage(of: "pause")
    }()
    
    private lazy var playImageView: UIImageView = {
        generatePlayPauseStackViewImage(of: "play")
    }()
    
    private var playPauseImageView: UIImageView?
    
    private lazy var playPauseView: UIView = {
        let playPauseView = UIView()
        
        let ballImageView = generatePlayPauseStackViewImage(of: "ball")
        playPauseImageView = generatePlayPauseStackViewImage(of: "play")
        
        configure(playPauseView: playPauseView, ballImageView: ballImageView)
        
        playPauseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnPause(_:))))
        
        return playPauseView
    }()
    
    private lazy var playPauseStackView: UIStackView = {
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
            constrain(view: $0, height: 24, width: 24.59)
        }
        
        stack.addArrangedSubview(playPauseView)
        constrain(view: playPauseView, height: 75, width: 74)
        
        [
            generatePlayPauseStackViewImage(of: "skip-forward"),
            generatePlayPauseStackViewImage(of: "repeat"),
        ].forEach {
            stack.addArrangedSubview($0)
            constrain(view: $0, height: 24, width: 24.59)
        }
        
        return stack
    }()
    
    //MARK: - Progress Bar
    
    private var progressBlueBarWidthConstraint: NSLayoutConstraint?
    
    private lazy var progressBarView: UIView = {
        let progressBarView = UIView()
        progressBarView.backgroundColor = .white
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        return progressBarView
    }()
    
    private lazy var progressBlueBar: UIView = {
        let progressBlueBar = UIView()
        progressBlueBar.backgroundColor = .blue
        progressBlueBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBlueBar
    }()
    
    private lazy var progressBarAnimation: UIViewPropertyAnimator = {
        UIViewPropertyAnimator(duration: TimeInterval(5), curve: .easeInOut) { [weak self] in
            self?.progressBarView.layoutIfNeeded()
        }
    }()
    
    private lazy var lowerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            progressBarView,
            playPauseStackView
        ].forEach {
            stack.addArrangedSubview($0)
        }
        
        return stack
    }()
    
    private lazy var upperStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            songImageView
        ].forEach {
            stack.addArrangedSubview($0)
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
        configureUpperStackView()
        configureLowerStackView()
        constrain(view: progressBarView, height: 4, width: 400)
        configureProgressBlueBar()
        constrain(view: songImageView, height: 215, width: 204)
    }
    
    private func setBackgroundColor() {
        backgroundColor = .black
    }
    
    private func generatePlayPauseStackViewImage(of imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    @objc private func handleTapOnPause(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
            interchangePlayPause()
    }
    
    private func interchangePlayPause() {
        // სწორი ზომის აიქონი რომ გამოვიდეს
        playPauseImageView?.deactivateAllConstraints()
        if playPauseImageView?.image == playImageView.image {
            scaleImage()
            checkIfSongEnded()
            progressBlueBarWidthConstraint?.constant = lowerStackView.bounds.width
            startFillUp()
            playPauseImageView?.image = pauseImageView.image
            constrain(view: playPauseImageView!, height: 40, width: 40)
        } else {
            descaleImage()
            playPauseImageView?.image = playImageView.image
            constrain(view: playPauseImageView!, height: 30, width: 30)
            if progressBarAnimation.isRunning {
                self.progressBarAnimation.pauseAnimation()
            }
            
        }
    }
    
    private func checkIfSongEnded() {
        if progressBarAnimation.state == UIViewAnimatingState.inactive {
            progressBarAnimation =  UIViewPropertyAnimator(duration: TimeInterval(5), curve: .easeInOut) { [weak self] in
                self?.progressBarView.layoutIfNeeded()
            }
            progressBlueBarWidthConstraint?.constant = 0
            progressBarView.layoutIfNeeded()
        }
    }
    
    private func startFillUp() {
        self.progressBarAnimation.startAnimation()
    }
    
    private func scaleImage() {
        UIView.animate(withDuration: 1, animations: {
            self.songImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { _ in
        }
    }
    
    private func descaleImage() {
        UIView.animate(withDuration: 1) {
            self.songImageView.transform = .identity
        }
    }
}

//MARK: - Constraints
extension MainView {
    private func configureLowerStackView() {
        addSubview(lowerStackView)
        NSLayoutConstraint.activate([
            lowerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lowerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            lowerStackView.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 40),
            lowerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureUpperStackView() {
        addSubview(upperStackView)
        NSLayoutConstraint.activate([
            upperStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            upperStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60)
        ])
    }
    
    private func constrain(view: UIView, height: Double, width: Double) {
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: height),
            view.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    private func configure(playPauseView: UIView, ballImageView: UIView) {
        constrain(view: ballImageView, height: 75, width: 74)
        constrain(view: playPauseImageView!, height: 30, width: 30)
        
        playPauseView.addSubview(ballImageView)
        playPauseView.addSubview(playPauseImageView!)
        
        NSLayoutConstraint.activate([
            ballImageView.centerXAnchor.constraint(equalTo: playPauseView.centerXAnchor),
            playPauseImageView!.centerXAnchor.constraint(equalTo: playPauseView.centerXAnchor),
            ballImageView.centerYAnchor.constraint(equalTo: playPauseView.centerYAnchor),
            playPauseImageView!.centerYAnchor.constraint(equalTo: playPauseView.centerYAnchor),
        ])
    }
    
    private func configureProgressBlueBar() {
        progressBarView.addSubview(progressBlueBar)
        progressBlueBarWidthConstraint = progressBlueBar.widthAnchor.constraint(equalToConstant: 10)
        NSLayoutConstraint.activate([
            progressBlueBar.leadingAnchor.constraint(equalTo: progressBarView.leadingAnchor),
            progressBlueBar.centerYAnchor.constraint(equalTo: progressBarView.centerYAnchor),
            progressBlueBar.heightAnchor.constraint(equalToConstant: 4),
            progressBlueBarWidthConstraint!
        ])
    }
}

//MARK: - MainViewControllerDelegate
extension MainView: MainViewControllerDelegate {
    
    //MARK: - LifeCycles
    func didLoad() {
        setUpUI()
    }
}
