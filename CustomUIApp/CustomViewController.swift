//
//  CustomViewController.swift
//  CustomUIApp
//
//  Created by Владислав Наумов on 24.03.2024.
//

import UIKit

class CustomViewController: UIViewController {

    var mainView = CustomView()
    
    // MARK: - CustomViewController Life Cycles
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

