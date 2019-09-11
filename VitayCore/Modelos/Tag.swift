//
//  Tah.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum TagTipo: String {
    case Enfermedad
    case Alergia
    case Capacidad
    case SinClasificar
}

public struct Tag {
    public var Id: String
    public var Tag: String
    public var Tipo: TagTipo
    
    public init() {
        self.Id = ""
        self.Tag = ""
        self.Tipo = .SinClasificar
    }
    
    public init(json: JSON) {
        self.Id = json["Id"].stringValue
        self.Tag = json["Tag"].stringValue
        let value = json["Tipo"].stringValue
        self.Tipo = TagTipo.init(rawValue: value) ?? .SinClasificar
    }
}

public struct TagCliente: Encodable, ToJson{
    public var Id: String
    public var Tipo: String
    
    public var toDictionary: [String: Any]? {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        return json
    }
    
    public init(tag: Tag) {
        Id = tag.Id
        Tipo = tag.Tipo.rawValue
    }
}
