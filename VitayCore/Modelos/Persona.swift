//
//  Persona.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

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
    
    public init(json: JSON) {
        self.ID = json["ID"].stringValue
        self.Nombre = json["Nombre"].stringValue
        self.PrimerApellido = json["PrimerApellido"].stringValue
        self.SegundoApellido = json["SegundoApellido"].stringValue
        let fecha = json["FechaNacimiento"].stringValue
        self.FechaNacimiento = String(fecha.split(separator: "T")[0]).replacingOccurrences(of: "-", with: "/")
        self.FotoPerfil = json["FotoPerfil"].stringValue
        self.Email = json["Email"].stringValue
        self.Telefono = json["Telefono"].stringValue
        self.Sex = Sexo()
        let id = json["SexoId"].intValue
        if let value = Store().Sexos.filter({ $0.Id == id }).first {
            self.Sex = value
        }
    }
}

