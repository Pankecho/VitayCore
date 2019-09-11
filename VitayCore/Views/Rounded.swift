//
//  Rounded.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

@IBDesignable
public class RoundedImage: UIImageView {
    public override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.cornerRadius = radius
    }
}

@IBDesignable
public class RoundedWrapper: UIView {
    
    private var calificacion: Double = 3
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        layer.cornerRadius = radius
        setSemiCircleBorder(width: 5, color: UIColor.white.cgColor, inicio: 0, fin: (5.0).toRadians)
        setSemiCircleBorder(width: 5, color: (UIColor(named: "Primary") ?? UIColor.blue).cgColor, inicio: 0, fin: calificacion.toRadians, false)
    }
    
    public func setCalificacion(rating: Double) {
        calificacion = rating
    }
}
