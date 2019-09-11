//
//  Settings.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Settings {
    public var Direccion: String
    public var Telefono: String
    public var TerminosYCondiciones: String
    
    public init(json: JSON) {
        Direccion = json["Direccion"].stringValue
        Telefono = json["Telefono"].stringValue
        TerminosYCondiciones = json["TerminosCondiciones"].stringValue
    }
    
    public init() {
        Direccion = ""
        Telefono = ""
        TerminosYCondiciones = ""
    }
}
