//
//  MKMapView.swift
//  VitayCore
//
//  Created by Juan Pablo on 10/24/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import MapKit

public extension MKMapView {
    func clean() {
        let anotaciones = annotations
        let capas = overlays
        removeOverlays(capas)
        removeAnnotations(anotaciones)
    }
}
