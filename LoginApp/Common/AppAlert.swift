//
//  AppAlert.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 01.10.2022.
//

import UIKit

class AppAlert {
    static func showAppNotification(
        controller : UIViewController,
        notificationText : String
    ) {
        let alert = UIAlertController(
            title: AppCommonStrings.appName,
            message: notificationText,
            preferredStyle: .alert
        )
    
        let ok = UIAlertAction(title: "OK", style: .default)
    
        alert.addAction(ok)
    
        controller.present(alert, animated: true)
    }
}

