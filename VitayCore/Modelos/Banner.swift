//
//  Banner.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct BannerPage {
    public var Nombre: String
    public var Descripcion: String
    public var ImagenURL: String
    
    public init(json: JSON) {
        Nombre = json["Nombre"].stringValue
        Descripcion = json["Descripcion"].stringValue
        ImagenURL = json["Imagen"].stringValue
    }
}
