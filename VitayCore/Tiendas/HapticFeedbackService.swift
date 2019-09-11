//
//  HapticFeedbackService.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public class HapticFeedbackService {
    
    public static let shared = HapticFeedbackService()
    
    private let notificationGenerator = UINotificationFeedbackGenerator()
    
    private let impactGenerator = UIImpactFeedbackGenerator(style: .light)
    
    public func successVibration() {
        notificationGenerator.notificationOccurred(.success)
    }
    
    public func errorVibration() {
        notificationGenerator.notificationOccurred(.error)
    }
    
    public func lightVibration() {
        impactGenerator.impactOccurred()
    }
}
