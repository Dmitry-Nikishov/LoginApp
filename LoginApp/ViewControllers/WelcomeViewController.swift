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
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let gradient = GradientFactory.createDefault()
        gradient.frame = view.bounds

        view.layer.insertSublayer(gradient, at: 0)
        
        welcomeLabel.text = "Welcome, \(userName)"
    }
    

}
