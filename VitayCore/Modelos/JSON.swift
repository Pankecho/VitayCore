//
//  JSON.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public protocol ToJson {
    var toDictionary: [String: Any]?{
        get
    }
}
