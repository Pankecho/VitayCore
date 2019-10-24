//
//  MKPolygon.swift
//  VitayCore
//
//  Created by Juan Pablo on 10/24/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import MapKit

public extension MKPolygon {
    func contains(location: CLLocation) -> Bool{
        let renderer = MKPolygonRenderer(polygon: self)
        let punto = MKMapPoint(location.coordinate)
        let poligonPoint = renderer.point(for: punto)
        return (poligonPoint.x.isInfinite || poligonPoint.y.isInfinite) ? false : renderer.path.contains(poligonPoint)
    }
}
