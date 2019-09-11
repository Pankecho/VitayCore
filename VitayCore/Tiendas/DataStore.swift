//
//  DataStore.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

open class Store {
    
    public var HOST: String
    
    public var PUERTO_ADMIN: Int
    public var PUERTO_MOVIL: Int
    
    public var Razones: [RazonCancelacion]
    public var Tags: [Tag]
    
    public let Sexos = [Sexo(id: 1, nombre: "Masculino"),
                        Sexo(id: 2, nombre: "Femenino"),
                        Sexo(id: 3, nombre: "Indefinido")]
    
    public init() {
        HOST = ""
        PUERTO_MOVIL = 80
        PUERTO_ADMIN = 80
        Razones = []
        Tags = []
    }
    
    public init(host: String, movil: Int, admin: Int) {
        HOST = host
        PUERTO_MOVIL = movil
        PUERTO_ADMIN = admin
        Razones = []
        Tags = []
    }
}
