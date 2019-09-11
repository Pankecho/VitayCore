//
//  Persona.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public class Person: Encodable, ToJson {
    public var ID: String
    public var Nombre: String
    public var PrimerApellido: String
    public var SegundoApellido: String
    public var FechaNacimiento: String
    public var Sex: Sexo
    public var FotoPerfil: String
    public var Email: String
    public var Telefono: String
    
    public var toDictionary: [String : Any]?{
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        return json
    }
    
    public init() {
        self.ID = ""
        self.Nombre = ""
        self.PrimerApellido = ""
        self.SegundoApellido = ""
        self.FechaNacimiento = ""
        self.FotoPerfil = ""
        self.Email = ""
        self.Telefono = ""
        self.Sex = Sexo()
    }
}

