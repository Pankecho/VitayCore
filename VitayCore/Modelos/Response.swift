//
//  Response.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/11/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Response{
    public var StatusCode: Int
    public var Data: JSON
    public var Mensaje: String
    
    public init (StatusCode: Int, Data: JSON, Mensaje: String) {
        self.StatusCode = StatusCode
        self.Data = Data
        self.Mensaje = Mensaje
    }
}
