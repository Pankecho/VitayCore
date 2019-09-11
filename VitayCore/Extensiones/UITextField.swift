//
//  UITextField.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension UITextField {
    func addBottomBorder(color: UIColor = UIColor(named: "DarkGray") ?? .black) {
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        bottom.backgroundColor = color.cgColor
        layer.masksToBounds = true
        layer.addSublayer(bottom)
    }
    
    func textIsEmpty() -> Bool {
        let texto = self.text ?? ""
        return texto.trimmingCharacters(in: CharacterSet.whitespaces).count == 0
    }
}
