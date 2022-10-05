//
//  TabBarViewController.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 05.10.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
    }
    
    private func setupTabBarAppearance() {
        let customAppearance = UITabBarAppearance()
        customAppearance.configureWithOpaqueBackground()
        
        tabBar.standardAppearance = customAppearance
        tabBar.scrollEdgeAppearance = customAppearance
    }
}
