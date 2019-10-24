//
//  UINavigationBar.swift
//  VitayCore
//
//  Created by Juan Pablo on 10/24/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension UINavigationController {
    func modifyBorders(add borders: Bool = false, color: UIColor = .white) {
        let imagen = color.image()
        navigationBar.setBackgroundImage(borders ? nil : imagen, for: UIBarMetrics.default)
        navigationBar.shadowImage = borders ? nil : imagen
    }
    
    func setColor(color: UIColor) {
        navigationBar.tintColor = color
        navigationBar.titleTextAttributes = [.foregroundColor: color]
    }
}
