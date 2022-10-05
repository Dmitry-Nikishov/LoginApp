//
//  ProfileDetailsController.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 05.10.2022.
//

import UIKit

class ProfileDetailsController: UIViewController {
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProfileDetailsData()
    }
    
    private func setProfileDetailsData() {
        guard let profileData = PersonProfiles.get().first else { return }
        
        detailsTextView.text = profileData.details
    }
}
