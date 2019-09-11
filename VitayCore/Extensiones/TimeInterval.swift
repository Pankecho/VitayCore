//
//  TimeInterval.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension TimeInterval {
    var toString: String {
        var cadena = ""
        let minutos = self / 60
        switch minutos {
        case 60...:
            let horas = minutos / 60
            let min = (Int(exactly: minutos) ?? 0) % 60
            cadena = "\(horas.parsedString) h. \(min) min."
            break
        case 1...60:
            cadena = "\(minutos.parsedString) min."
            break
        default:
            cadena = "\(self.parsedString) s."
            break
        }
        return cadena
    }
    
    func formatHour() -> String{
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
