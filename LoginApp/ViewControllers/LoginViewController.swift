//
//  ViewController.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 30.09.2022.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private var passwordMode = PasswordMode.hidden {
        didSet {
            setupPasswordMode(mode: passwordMode)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
    }
    
    @IBAction func forgotUserNameButtonDidTapped() {
        AppAlert.showAppNotification(
            controller: self,
            notificationText: "Expected user name : \(AppCredentials.defaultCredentials.userName)")
    }
    
    @IBAction func forgotPasswordButtonDidTapped() {
        AppAlert.showAppNotification(
            controller: self,
            notificationText: "Expected password : \(AppCredentials.defaultCredentials.password)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        
        if identifier == "loginToWelcomeSegue" {
            if let uiCredentials = getCredentialsFromUserInput(),
                   uiCredentials == AppCredentials.defaultCredentials {
                return true
            } else {
                AppAlert.showAppNotification(
                    controller: self,
                    notificationText: "Invalid credentials"
                )
            }
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        
        welcomeVC.userName = userNameTF.text ?? ""
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @objc private func togglePasswordMode() {
        passwordMode = passwordMode == .shown ? .hidden : .shown
    }
    
    private func getCredentialsFromUserInput() -> Credentials? {
        if let userName = userNameTF.text,
           let password = passwordTF.text {
            return Credentials(userName: userName, password: password)
        } else {
            return nil
        }
    }
    
    private func setupSubViews() {
        logInButton.titleLabel?.adjustsFontSizeToFitWidth = true        
        logInButton.titleLabel?.minimumScaleFactor = 0.5
        
        let overlayButton = UIButton(type: .custom)
        overlayButton.addTarget(
            self,
            action: #selector(togglePasswordMode),
            for: .touchUpInside
        )
        overlayButton.sizeToFit()
        passwordTF.rightView = overlayButton
        passwordTF.rightViewMode = .always

        setupPasswordMode(mode: passwordMode)
    }
    
    private func setupPasswordMode(mode: PasswordMode) {
        let overlayButton = passwordTF.rightView as? UIButton
        
        switch mode {
        case .hidden:
            passwordTF.isSecureTextEntry = true
            overlayButton?.setImage(
                UIImage(systemName: "eye.slash"),
                for: .normal
            )
        case .shown:
            passwordTF.isSecureTextEntry = false
            overlayButton?.setImage(
                UIImage(systemName: "eye"),
                for: .normal
            )
        }
    }

}
