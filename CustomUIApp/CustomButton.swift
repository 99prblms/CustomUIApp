//
//  CustomButton.swift
//  CustomUIApp
//
//  Created by Владислав Наумов on 24.03.2024.
//

import UIKit
import AudioToolbox

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setupButton() {
        setTitleColor(.black, for: .normal)
        backgroundColor = .systemGreen
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius = 15
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    // Тряска кнопки + вибрация
    func shakeButton() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {}
        layer.add(shake, forKey: "position")
    }
    // Переворот кнопки
    func flipButton() {
        UIView.animate(withDuration: 0.3, delay: .zero, options: .curveLinear) {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.transform = .identity
            }
        }
    }
    // Анимация прожимания кнопки + тактильная отдача
    func pushButton() {
        UIView.animate(withDuration: 0.1, delay: .zero, options: .curveLinear) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        }
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
    }
}
