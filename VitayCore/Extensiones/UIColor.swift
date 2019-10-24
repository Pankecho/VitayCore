//
//  UIColor.swift
//  VitayCore
//
//  Created by Juan Pablo on 10/24/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    func toHex() -> String {
        guard let components = cgColor.components, components.count >= 3 else { return "" }
        let rojo = components[0]
        let verde = components[1]
        let azul = components[2]
        return String(format: "%02lX%02lX%02lX", lroundf(Float(rojo * 255)), lroundf(Float(verde * 255)), lroundf(Float(azul * 255)))
    }
}
