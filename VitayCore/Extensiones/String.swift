//
//  String.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension String{
    /// Función que checa un Regex para verificar si un String es un correo electrónico
    ///
    /// - Returns: True si parece un Correo electrónico o false en el caso contrario
    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    static func areEmpty(cadenas: String...) -> Bool {
        let valor = cadenas.filter({ $0.isEmpty }).count
        return cadenas.count == valor
    }
}
