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
        var myImageView = UIImageView()
        myImageView.image = UIImage(named: "stars")
        return myImageView
    }()
    
    func setupMoonImageView() {
        moonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        moonImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        moonImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 75).isActive = true
        moonImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -75).isActive = true
        moonImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true
    }
    
    func setupSunImageView() {
        sunImageView.translatesAutoresizingMaskIntoConstraints = false
        
        sunImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        sunImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: -250).isActive = true
        sunImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -400).isActive = true
        sunImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true
    }
    
    func setupCloudImageView() {
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        
        cloudImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -300).isActive = true
        cloudImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: -125).isActive = true
        cloudImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        cloudImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -900).isActive = true
    }
    
    func setupStarImageView() {
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        
        starImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 125).isActive = true
        starImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        starImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
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
        self.backgroundColor = .blue
        
        // Появление солнца
        let animation = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.moonImageView.frame = self.moonImageView.frame.offsetBy(dx: 400, dy: 0)
            self.sunImageView.frame = self.sunImageView.frame.offsetBy(dx: 325, dy: 0)
            self.starImageView.frame = self.starImageView.frame.offsetBy(dx: 0, dy: -300)
            self.cloudImageView.frame = self.cloudImageView.frame.offsetBy(dx: 0, dy: 300)
        }
        animation.startAnimation()
        
    }
    
    @objc func tapFlipButton() {
        flipButton.flipButton()
        self.backgroundColor = .black
        
        // Появление луны
        let animation = UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
            self.moonImageView.frame = self.moonImageView.frame.offsetBy(dx: -400, dy: 0)
            self.sunImageView.frame = self.sunImageView.frame.offsetBy(dx: -325, dy: 0)
            self.starImageView.frame = self.starImageView.frame.offsetBy(dx: 0, dy: 300)
            self.cloudImageView.frame = self.cloudImageView.frame.offsetBy(dx: 0, dy: -300)
        }
        animation.startAnimation()
        
    }
    
    @objc func tapPushButton() {
        pushButton.pushButton()
        
    }
    
    
}
