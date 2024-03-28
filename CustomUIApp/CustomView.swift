//
//  CustomView.swift
//  CustomUIApp
//
//  Created by Владислав Наумов on 24.03.2024.
//

import UIKit
import Lottie

class CustomView: UIView {
    
    var flagOnOff = true
    
    private var shakeButton: CustomButton = {
        let shake = CustomButton()
        shake.setTitle("Shake button", for: .normal)
        return shake
    }()
    
   private var flipButton: CustomButton = {
        let flip = CustomButton()
        flip.setTitle("Flip button", for: .normal)
        return flip
    }()
    
    private var pushButton: CustomButton = {
        let push = CustomButton()
        push.setTitle("Push button", for: .normal)
        return push
    }()
    
    private var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 10
        buttonsStackView.distribution = .fillEqually
        return buttonsStackView
    }()
    
    private var switchDayNight: AnimationView = {
        let switchDayNight = AnimationView()
        switchDayNight.animation = Animation.named("Animation")
        switchDayNight.loopMode = .playOnce
        switchDayNight.layer.borderWidth = 5
        switchDayNight.backgroundColor = .systemFill
        switchDayNight.layer.cornerRadius = 25
        switchDayNight.isUserInteractionEnabled = true
        
        return switchDayNight
    }()
    
    var moonImageView: UIImageView = {
        var myImageView = UIImageView()
        myImageView.image = UIImage(named: "moon")
        return myImageView
    }()
    
    var sunImageView: UIImageView = {
        var myImageView = UIImageView()
        myImageView.image = UIImage(named: "sun")
        return myImageView
    }()
    
    var cloudImageView: UIImageView = {
        var myImageView = UIImageView()
        myImageView.image = UIImage(named: "cloud")
        return myImageView
    }()
    
    var starImageView: UIImageView = {
        var starImageView = UIImageView()
        starImageView.image = UIImage(named: "star")
        return starImageView
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .night
        addSubviews()
        setupButtonsStackView()
        setupMoonImageView()
        setupSunImageView()
        setupCloudImageView()
        setupStarImageView()
        switchDayNightSetup()
    }
    
    func addSubviews() {
        [buttonsStackView, moonImageView, sunImageView, cloudImageView, starImageView, switchDayNight].forEach { addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func tapShakeButton() {
        shakeButton.shakeButton()
    }
    
    @objc func tapFlipButton() {
        flipButton.flipButton()
    }
    
    @objc func tapPushButton() {
        pushButton.pushButton()
    }
    
    @objc func switchDayNightTapped() {
        if flagOnOff {
            switchDayNight.play()
            // Появление солнца
            let animation = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
                self.starImageView.frame.origin = CGPoint(x: -300, y: 35)
                self.cloudImageView.frame.origin = CGPoint(x: 145, y: 150)
                self.moonImageView.frame.origin = CGPoint(x: 35, y: -300)
                self.sunImageView.frame.origin = CGPoint(x: 80, y: 95)
            }
            animation.startAnimation()
            
            let color = UIColor.day
            UIView.transition(
                with: self,
                duration: 0.5,
                options: .showHideTransitionViews) {
                    self.backgroundColor = color
                }
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
            
        } else {
            switchDayNight.play(fromProgress: 1, toProgress: 0, loopMode: .none, completion: nil)
            // Появление луны
            let animation = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
                self.starImageView.frame.origin = CGPoint(x: 145, y: 66.5)
                self.cloudImageView.frame.origin = CGPoint(x: -300, y: 35)
                self.moonImageView.frame.origin = CGPoint(x: 26, y: 65.5)
                self.sunImageView.frame.origin = CGPoint(x: 35, y: -300)
            }
            animation.startAnimation()
            
            let color = UIColor.night
            UIView.transition(
                with: self,
                duration: 0.5,
                options: .showHideTransitionViews) {
                    self.backgroundColor = color
                }
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
        }
        flagOnOff.toggle()
    }
    
    // MARK: - Private Methods
    
    private func setupMoonImageView() {
        moonImageView.translatesAutoresizingMaskIntoConstraints = false
        moonImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        moonImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        moonImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        moonImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -450).isActive = true
        moonImageView.contentMode = .scaleAspectFit
    }
    
    private func setupSunImageView() {
        sunImageView.translatesAutoresizingMaskIntoConstraints = false
        sunImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -380).isActive = true
        sunImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 80).isActive = true
        sunImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -80).isActive = true
        sunImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -920).isActive = true
        sunImageView.contentMode = .scaleAspectFit
    }
    
    private func setupCloudImageView() {
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        cloudImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        cloudImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: -250).isActive = true
        cloudImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -400).isActive = true
        cloudImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -450).isActive = true
        cloudImageView.contentMode = .scaleAspectFit
    }
    
    private func setupStarImageView() {
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 145).isActive = true
        starImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        starImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -540).isActive = true
        starImageView.contentMode = .scaleAspectFit
    }
    
    private func setupButtonsStackView() {
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 500).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        buttonsStackView.addArrangedSubview(shakeButton)
        buttonsStackView.addArrangedSubview(flipButton)
        buttonsStackView.addArrangedSubview(pushButton)
        
        shakeButton.addTarget(self, action: #selector(tapShakeButton), for: .touchUpInside)
        flipButton.addTarget(self, action: #selector(tapFlipButton), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(tapPushButton), for: .touchUpInside)
        buttonsStackView.contentMode = .scaleAspectFit
    }
    
    private func switchDayNightSetup() {
        
        switchDayNight.translatesAutoresizingMaskIntoConstraints = false
        switchDayNight.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 405).isActive = true
        switchDayNight.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        switchDayNight.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -290).isActive = true
        switchDayNight.bottomAnchor.constraint(equalTo: buttonsStackView.safeAreaLayoutGuide.topAnchor, constant: -10).isActive = true
        
        let tapGestureDayNight = UITapGestureRecognizer(target: self, action: #selector(switchDayNightTapped))
        switchDayNight.addGestureRecognizer(tapGestureDayNight)
        
        switchDayNight.contentMode = .scaleAspectFit
    }
}

