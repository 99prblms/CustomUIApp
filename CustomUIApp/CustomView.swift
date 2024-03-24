//
//  CustomView.swift
//  CustomUIApp
//
//  Created by Владислав Наумов on 24.03.2024.
//

import UIKit

class CustomView: UIView {
    
    var myButton = CustomButton()
    
    func constMyButton() {
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        myButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        myButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        myButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        myButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -600).isActive = true
        myButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    init(myButton: CustomButton = CustomButton()) {
        self.myButton = myButton
        super.init(frame: .zero)
        addSubviews()
        constMyButton()
    }
    
    func addSubviews() {
        [myButton].forEach { addSubview($0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapButton() {
        myButton.flipButton()
        
    }
    
    
}
