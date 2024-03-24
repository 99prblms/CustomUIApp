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
    
    func constShakeButton() {
        shakeButton.translatesAutoresizingMaskIntoConstraints = false
        
        shakeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        shakeButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        shakeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        shakeButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -625).isActive = true
        shakeButton.addTarget(self, action: #selector(tapShakeButton), for: .touchUpInside)
    }
    
    func constFlipButton() {
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        
        flipButton.topAnchor.constraint(equalTo: shakeButton.bottomAnchor, constant: 50).isActive = true
        flipButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        flipButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        flipButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -450).isActive = true
        flipButton.addTarget(self, action: #selector(tapFlipButton), for: .touchUpInside)
    }
    
    func constPushButton() {
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        
        pushButton.topAnchor.constraint(equalTo: flipButton.bottomAnchor, constant: 50).isActive = true
        pushButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        pushButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        pushButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -285).isActive = true
        pushButton.addTarget(self, action: #selector(tapPushButton), for: .touchUpInside)
    }
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        constShakeButton()
        constFlipButton()
        constPushButton()
    }
    
    func addSubviews() {
        [shakeButton, flipButton, pushButton].forEach { addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapShakeButton() {
        shakeButton.shakeButton()
        
    }
    
    @objc func tapFlipButton() {
        flipButton.flipButton()
        
    }
    
    @objc func tapPushButton() {
        pushButton.pushButton()
        
    }
    
    
}
