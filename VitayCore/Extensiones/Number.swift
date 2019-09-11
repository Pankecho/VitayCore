//
//  Number.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension Double{
    var parsedString: String{
        let formatString = "%.0f"
        return String(format: formatString, self)
    }
    
    var parsedMoney: String{
        let formatString = "%.2f"
        return String(format: formatString, self)
    }
    
    var doubleRound: String{
        let formatString = "%02f"
        return String(format: formatString, self)
    }
    
    var calificacion: String{
        let formatString = "%.1f"
        return String(format: formatString, self)
    }
    
    var toRadians: CGFloat {
        let total = (self * 360) / 5
        let final: CGFloat = CGFloat(total) * (.pi / 180)
        return final
    }
}

public extension Int {
    var doubleRound: String{
        let formatString = "%02d"
        return String(format: formatString, self)
    }
}
