//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 30.09.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String = ""
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.cyan.cgColor,
            UIColor.blue.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.4, 0.9]
        return gradient
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient.frame = view.bounds

        view.layer.insertSublayer(gradient, at: 0)
        
        welcomeLabel.text = "Welcome, \(userName)"
    }
    

}
