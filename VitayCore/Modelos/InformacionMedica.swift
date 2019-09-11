//
//  InformacionMedica.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

public class DatosMedicos {
    public var TipoSangre: SangreTipo
    public var Peso: Double
    public var RitmoCardiaco: Double
    public var PresionArterial: Double
    public var Estatura: Double
    public var Tags: [Tag]
    public var isLoaded: Bool
    
    public init() {
        TipoSangre = .OPositivo
        Peso = 0.0
        RitmoCardiaco = 0.0
        PresionArterial = 0.0
        Estatura = 0.0
        Tags = []
        isLoaded = false
    }
    
    public init(json: JSON) {
        TipoSangre = SangreTipo(rawValue: json["TipoSangre"].stringValue) ?? .OPositivo
        Peso = json["Peso"].doubleValue
        RitmoCardiaco = json["RitmoCardiaco"].doubleValue
        PresionArterial = json["PresionArterial"].doubleValue
        Estatura = json["Estatura"].doubleValue
        isLoaded = json["InformacionMedica"].boolValue
        Tags = []
        let enfermedades = json["Enfermedades"].arrayValue.map({ Tag(json: $0) })
        let alergias = json["Alergias"].arrayValue.map({ Tag(json: $0) })
        let capacidades = json["Capacidades"].arrayValue.map({ Tag(json: $0) })
        Tags.append(contentsOf: enfermedades)
        Tags.append(contentsOf: alergias)
        Tags.append(contentsOf: capacidades)
    }
}

public struct InformacionMedica: Encodable, ToJson{
    public var Peso: Double
    public var Ritmo: Double
    public var Presion: Double
    public var Estatura: Double
    public var TipoSangre: String
    public var Tags: [TagCliente]
    
    public var toDictionary: [String: Any]? {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        return json
    }
    
    public init(peso: Double, ritmo: Double, presion: Double, estatura: Double, tipo: String, tags: [TagCliente]) {
        Peso = peso
        Ritmo = ritmo
        Presion = presion
        Estatura = estatura
        TipoSangre = tipo
        Tags = tags
    }
}

public enum SangreTipo: String {
    case APositivo = "A+"
    case ANegativo = "A-"
    case BPositivo = "B+"
    case BNegativo = "B-"
    case OPositivo = "O+"
    case ONegativo = "O-"
    case ABPositivo = "AB+"
    case ABNegativo = "AB-"
}
