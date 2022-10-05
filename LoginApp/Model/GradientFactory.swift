//
//  GradientFactory.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 05.10.2022.
//

import UIKit

struct GradientFactory {
    static func createDefault() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.cyan.cgColor,
            UIColor.blue.cgColor,
            UIColor.cyan.cgColor
        ]
        gradient.locations = [0, 0.4, 0.9]
        return gradient
    }
    
    static func create(
        type: CAGradientLayerType,
        colors: [Any]?,
        locations: [NSNumber]?
    ) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = type
        gradient.colors = colors
        gradient.locations = locations
        return gradient
    }
    
    private init() {}
}
