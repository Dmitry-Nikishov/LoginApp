//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 05.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyDataFromModel()
    }
    
    private func applyDataFromModel() {
        guard let profileData = PersonProfiles.get().first else { return }
        
        nameLabel.text = profileData.name
        surnameLabel.text = profileData.surname
        positionLabel.text = profileData.position
        departmentLabel.text = profileData.departmentName
        companyLabel.text = profileData.companyName
        
        navigationItem.title = "\(profileData.name) \(profileData.surname)"
    }
    
}
