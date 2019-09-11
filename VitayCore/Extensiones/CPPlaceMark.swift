//
//  MKAnnotation.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import MapKit

public extension CLPlacemark{
    func toAddress() -> String{
        return "\(self.thoroughfare ?? NSLocalizedString("StreetUnnamed", comment: "")) \(self.subThoroughfare ?? "S/N"), \(self.subLocality ?? (self.locality ?? "N/A"))"
    }
}
