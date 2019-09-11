//
//  RazonCancelacion.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public enum TipoCancelacion: String {
    case CLIENTE
    case AGENTE
    case AMBOS
}

public class RazonCancelacion{
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
}
