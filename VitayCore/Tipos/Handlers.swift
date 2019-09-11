//
//  Handlers.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public typealias successHandler = ((_ success: Bool, _ error: Error?) -> Void)
public typealias dataHandler<T> = ((_ data: T?, _ error: Error?) -> Void)
public typealias normalHandler = (() -> Void)
