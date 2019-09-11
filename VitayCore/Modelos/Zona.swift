//
//  Zone.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Geozona: Encodable, ToJson {
    public var Lat: Double = 0.0
    public var Long: Double = 0.0
    public var Index: Int = 0
    
    public var toDictionary: [String : Any]?{
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
        return json
    }
    
    public init() {
        self.Lat = 0.0
        self.Long = 0.0
        self.Index = 0
    }
    
    public init(lat: Double, long: Double) {
        self.Lat = lat
        self.Long = long
        self.Index = 0
    }
    
    public init(json: JSON) {
        self.Lat = json["Latitud"].doubleValue
        self.Long = json["Longitud"].doubleValue
        self.Index = json["Index"].intValue
    }
    
    public func parse() -> Data{
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(self)
        return data
    }
}

public struct Zone: Encodable{
    public var Id: String
    public var Geozonas: [Geozona]
    
    public init() {
        self.Id = ""
        self.Geozonas = []
    }
    
    public init(json: JSON) {
        self.Id = json["Id"].stringValue
        self.Geozonas = []
        let array = json["Geozonas"].arrayValue
        array.forEach { (i) in
            let geo = Geozona(json: i)
            self.Geozonas.append(geo)
        }
    }
}
