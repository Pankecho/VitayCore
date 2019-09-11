//
//  RazonCancelacion.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum TipoCancelacion: String {
    case CLIENTE
    case AGENTE
    case AMBOS
}

public struct RazonCancelacion{
    public var Id: String
    public var Nombre: String
    public var Index: Int
    public var Tipo: TipoCancelacion
    
    public init(){
        Id = ""
        Nombre = ""
        Index = 0
        Tipo = .AMBOS
    }
    
    public init(json: JSON){
        Id = json["Id"].stringValue
        Nombre = json["Nombre"].stringValue
        Index = json["Index"].intValue
        let value = json["Tipo"].stringValue
        Tipo = TipoCancelacion(rawValue: value) ?? .AMBOS
    }
}
