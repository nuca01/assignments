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
    func setSongPlayedTime(with: Double)
    func getSongPlayedTime() -> Double
}

final class MainView: UIView {
    
    //MARK: - Properties
    private var delegate: MainViewDelegate?
    
    private lazy var songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: delegate?.getSongCoverImageName() ?? "")
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
        stack.isUserInteractionEnabled = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            progressBarView,
            timeStackView,
            playPauseStackView,
            bottomImageView
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
            songImageView,
        ].forEach {
            stack.addArrangedSubview($0)
        }
        
        return stack
    }()
    
    //MARK: - circularProgressBar
    private lazy var circularProgressBar: CircularProgressView = {
        let circleOnSceneView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        circleOnSceneView.setProgressColor = .clear
        circleOnSceneView.setTrackColor = .clear
        circleOnSceneView.translatesAutoresizingMaskIntoConstraints = false
        return circleOnSceneView
    }()
    
    //MARK: - timeStackView
    private lazy var timeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            playedTimeLabel,
            lengthLabel
        ].forEach {
            stack.addArrangedSubview($0)
        }
        
        return stack
    }()
    
    private lazy var playedTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "\(String(describing: getMinutesFromSeconds(seconds: delegate?.getSongPlayedTime() ?? 0)))"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var timer: Timer?
    
    private var isTimerRunning = false
    
    private lazy var lengthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "\(String(describing: getMinutesFromSeconds(seconds: delegate?.getSongLength() ?? 0)))"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - bottomImagesStackView
    private lazy var bottomImagesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.isUserInteractionEnabled = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            homeImageView,
            musicImageView,
            heartImageView
        ].forEach {
            stack.addArrangedSubview($0)
            constrain(view: $0, height: 20, width: 20)
        }
        return stack
    }()
    
    private lazy var bottomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle")
        imageView.contentMode = .redraw
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scaleBottomItem(_:))))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "music")
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scaleBottomItem(_:))))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "heart")
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(scaleBottomItem(_:))))
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - initialisers
    
    init(delegate: MainViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpUI(){
        setBackgroundColor()
        constrain(view: circularProgressBar, height: 50, width: 50)
        constrain(view: progressBarView, height: 4, width: 400)
        configureProgressBlueBar()
        constrain(view: songImageView, height: 215, width: 204)
        addSubview(circularProgressBar)
        configureUpperStackView()
        configureCircularStackView()
        configureLowerStackView()
        configureBottomImageView()
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
    
    private func getMinutesFromSeconds(seconds: Double) -> String {
        let minutes = Int(seconds / 60)
        let seconds = Int(seconds) - (minutes * 60)
        return String(String(minutes) + ":" + String(seconds))
    }
    
    //MARK: - HandleTapOnPause Helper Methods
    private func interchangePlayPause() {
        // სწორი ზომის აიქონი რომ გამოვიდეს
        self.playPauseImageView?.deactivateAllConstraints()
        if self.playPauseImageView?.image == self.playImageView.image {
            load()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
            {
                self.timeCountingEnable()
                self.deactivateLoading()
                self.scaleImage()
                self.checkIfSongEnded()
                self.startFillUp()
                self.playPauseImageView?.image = self.pauseImageView.image
                self.constrain(view: self.playPauseImageView!, height: 40, width: 40)
            }
        } else {
            timeCountingDisable()
            self.descaleImage()
            self.playPauseImageView?.image = self.playImageView.image
            self.constrain(view: self.playPauseImageView!, height: 30, width: 30)
            self.progressBarAnimation.pauseAnimation()
            
        }
    }
    
    private func load() {
        circularProgressBar.setProgressColor = .blue
        circularProgressBar.setTrackColor = .gray
        circularProgressBar.setProgressWithAnimation(duration: 0.5, value: 1)
    }
    
    private func deactivateLoading() {
        circularProgressBar.setProgressColor = .clear
        circularProgressBar.setTrackColor = .clear
    }
    
    private func checkIfSongEnded() {
        if progressBarAnimation.state == UIViewAnimatingState.inactive {
            progressBarAnimation =  UIViewPropertyAnimator(duration: TimeInterval(delegate?.getSongLength() ?? 0), curve: .easeInOut) { [weak self] in
                self?.progressBarView.layoutIfNeeded()
            }
            progressBlueBarWidthConstraint?.constant = 0
            progressBarView.layoutIfNeeded()
            delegate?.setSongPlayedTime(with: 0)
            playedTimeLabel.text = getMinutesFromSeconds(seconds: delegate?.getSongPlayedTime() ?? 0)
        }
    }
    
    private func startFillUp() {
        progressBlueBarWidthConstraint?.constant = lowerStackView.bounds.width
        self.progressBarAnimation.startAnimation()
    }
    
    private func scaleImage() {
        UIView.animate(withDuration: 1, animations: {
            self.songImageView.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        }) { _ in
        }
    }
    
    private func descaleImage() {
        UIView.animate(withDuration: 1) {
            self.songImageView.transform = .identity
        }
    }
    
    private func timeCountingEnable() {
        if !isTimerRunning {
            isTimerRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                if progressBarAnimation.state != UIViewAnimatingState.inactive
                {
                    delegate?.setSongPlayedTime(with: (delegate?.getSongPlayedTime() ?? 0) + 1)
                    playedTimeLabel.text = getMinutesFromSeconds(seconds: delegate?.getSongPlayedTime() ?? 0)
                    print(delegate?.getSongPlayedTime() ?? 0)
                } else {
                    isTimerRunning = false
                }
            }
        }
    }
    
    private func timeCountingDisable() {
        timer?.invalidate()
        isTimerRunning = false
    }
    
    //MARK: - scaleBottomItem
    @objc private func scaleBottomItem(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else {return}
        deselectOtherItems()
        imageView.image = imageView.image?.withTintColor(.blue)
        UIView.animate(withDuration: 1, animations: {
            sender.view!.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        }) { _ in
        }
    }
    
    private func deselectOtherItems() {
        var items = [heartImageView, musicImageView, homeImageView]
        for item in items {
            item.image = item.image?.withTintColor(.gray)
            UIView.animate(withDuration: 0.5, animations: {
                item.transform = .identity
            }) { _ in
            }
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
            lowerStackView.topAnchor.constraint(equalTo: circularProgressBar.bottomAnchor, constant: 40),
            lowerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureUpperStackView() {
        addSubview(upperStackView)
        NSLayoutConstraint.activate([
            upperStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            upperStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80)
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
        progressBlueBarWidthConstraint = progressBlueBar.widthAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            progressBlueBar.leadingAnchor.constraint(equalTo: progressBarView.leadingAnchor),
            progressBlueBar.centerYAnchor.constraint(equalTo: progressBarView.centerYAnchor),
            progressBlueBar.heightAnchor.constraint(equalToConstant: 4),
            progressBlueBarWidthConstraint!
        ])
    }
    
    private func configureCircularStackView() {
        NSLayoutConstraint.activate([
            circularProgressBar.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 20),
            circularProgressBar.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func configureBottomImageView() {
        NSLayoutConstraint.activate([
            bottomImageView.heightAnchor.constraint(equalToConstant: 85),
        ])
        bottomImageView.addSubview(bottomImagesStackView)
        NSLayoutConstraint.activate([
            bottomImagesStackView.centerXAnchor.constraint(equalTo: bottomImageView.centerXAnchor),
            bottomImagesStackView.centerYAnchor.constraint(equalTo: bottomImageView.centerYAnchor),
            bottomImagesStackView.leadingAnchor.constraint(equalTo: bottomImageView.leadingAnchor, constant: 30),
            bottomImagesStackView.trailingAnchor.constraint(equalTo: bottomImageView.trailingAnchor, constant: -30)
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
