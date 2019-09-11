//
//  GeneralProtocol.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/3/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public protocol General {
    func showError(error: Error)
    func success()
}
