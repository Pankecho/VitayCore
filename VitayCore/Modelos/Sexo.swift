//
//  Sexi.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public struct Sexo: Encodable, ToJson{
    public var Id: Int
    public var Nombre: String
    
    public var toDictionary: [String: Any]? {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        return json
    }
    
    public init() {
        Id = 0
        Nombre = ""
    }
    
    public init(id: Int, nombre: String) {
        Id = id
        Nombre = nombre
    }
}
