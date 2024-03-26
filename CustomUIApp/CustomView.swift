//
//  CustomView.swift
//  CustomUIApp
//
//  Created by Владислав Наумов on 24.03.2024.
//

import UIKit

class CustomView: UIView {
    
    var shakeButton: CustomButton = {
        let shake = CustomButton()
        shake.setTitle("Shake button", for: .normal)
        return shake
    }()
    
    var flipButton: CustomButton = {
        let flip = CustomButton()
        flip.setTitle("Flip button", for: .normal)
        return flip
    }()
    
    var pushButton: CustomButton = {
        let push = CustomButton()
        push.setTitle("Push button", for: .normal)
        return push
    }()
    
    var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 10
        buttonsStackView.distribution = .fillEqually
        return buttonsStackView
    }()
    
    func setupButtonsStackView() {
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
    }
    
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
    
    func setupMoonImageView() {
        moonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        moonImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        moonImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        moonImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        moonImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -450).isActive = true
        
        moonImageView.contentMode = .scaleAspectFit
    }
    
    func setupSunImageView() {
        sunImageView.translatesAutoresizingMaskIntoConstraints = false
        
        sunImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -380).isActive = true
        sunImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 80).isActive = true
        sunImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -80).isActive = true
        sunImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -920).isActive = true
        
        sunImageView.contentMode = .scaleAspectFit
    }
    
    func setupCloudImageView() {
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        
        cloudImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        cloudImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: -250).isActive = true
        cloudImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -400).isActive = true
        cloudImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -450).isActive = true
        
        cloudImageView.contentMode = .scaleAspectFit
    }
    
    func setupStarImageView() {
        starImageView.translatesAutoresizingMaskIntoConstraints = false

        starImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 145).isActive = true
        starImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        starImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -540).isActive = true
        
        starImageView.contentMode = .scaleAspectFit
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .night
        addSubviews()
        setupButtonsStackView()
        setupMoonImageView()
        setupSunImageView()
        setupCloudImageView()
        setupStarImageView()
    }
    
    func addSubviews() {
        [buttonsStackView, moonImageView, sunImageView, cloudImageView, starImageView].forEach { addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapShakeButton() {
        shakeButton.shakeButton()
        
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
    }
    
    @objc func tapFlipButton() {
        flipButton.flipButton()
        
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
    }
    
    @objc func tapPushButton() {
        pushButton.pushButton()
        
    }
    
    
}
