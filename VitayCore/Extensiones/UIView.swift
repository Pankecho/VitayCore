//
//  UIView.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public enum BorderType {
    case LEFT
    case RIGHT
    case CENTER
    case FULL
}

public extension UIView{
    func fixInView(_ container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        frame = container.frame
        container.addSubview(self)
        trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
    
    func setBorder(width: CGFloat, color: CGColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    func round(){
        let tamaño = self.frame.height / 2
        layer.cornerRadius = tamaño
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    func bounce(){
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }) { (_) in
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.transform = .identity
            }, completion: nil)
        }
    }
    
    func breathe(inOut: Bool = true, duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.transform = inOut ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
        }, completion: nil)
    }
    
    func changeBackgroundColorAnimated(color: UIColor?, _ time: TimeInterval = 0.2) {
        UIView.animate(withDuration: time, delay: 0, options: [.transitionFlipFromLeft], animations: {
            self.backgroundColor = color
            }, completion: nil)
    }
    
    func blinkBackground(rate: Double, color: UIColor?) {
        UIView.animate(withDuration: rate, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.backgroundColor = color
        })
    }
    
    func setSemiCircleBorder(width: CGFloat, color: CGColor, inicio: CGFloat = 0, fin: CGFloat = .pi, _ replace: Bool = true) {
        let capa = CAShapeLayer()
        let centro = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        let circleRadius = (frame.size.width / 2) - (width / 2)
        let circlePath = UIBezierPath(arcCenter: centro, radius: circleRadius, startAngle: inicio, endAngle: fin, clockwise: true)
        capa.path = circlePath.cgPath
        capa.lineWidth = width
        capa.strokeColor = color
        capa.strokeStart = 0
        capa.strokeEnd = 1
        capa.lineCap = .round
        capa.fillColor = UIColor.clear.cgColor
        guard let nueva = layer.sublayers?.filter({ $0 is CAShapeLayer }).first else {
            layer.addSublayer(capa)
            return
        }
        replace ? layer.replaceSublayer(nueva, with: capa) : layer.addSublayer(capa)
    }
    
    func setBottomBorder(type: BorderType = .FULL, thickness: CGFloat = 1, color: UIColor? = UIColor(named: "Gray")) {
        let capa = CALayer()
        switch type {
        case .LEFT:
            capa.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width - 20, height: thickness)
            break
        case .CENTER:
            capa.frame = CGRect(x: 20, y: frame.height - thickness, width: frame.width - 32, height: thickness)
            break
        case .RIGHT:
            capa.frame = CGRect(x: 20, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case .FULL:
            capa.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        }
        capa.backgroundColor = color?.cgColor
        layer.addSublayer(capa)
    }
    
    func showView(hide: Bool = true) {
        UIView.animate(withDuration: 0.25) {
            self.alpha = hide ? 0 : 1
            self.isHidden = hide
        }
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0
        }) {(_) in
            self.removeFromSuperview()
        }
    }
    
    func addSubViewAnimated(vista: UIView) {
        vista.alpha = 0
        UIView.animate(withDuration: 0.25, animations: {
            vista.alpha = 1
        }) { _ in
            self.addSubview(vista)
        }
    }
    
    func changeBackgroundColor(to color: UIColor, time: TimeInterval, opcion: UIView.AnimationOptions ) {
        UIView.animate(withDuration: time, delay: 0, options: opcion, animations: {
            self.backgroundColor = color
        }, completion: nil)
    }
    
    func banish(_ value: Bool = true) {
        UIView.animate(withDuration: 0.25) {
            self.alpha = value ? 0 : 1
        }
    }
    
    func addBorderBottom(color: UIColor = UIColor(named: "DarkGray") ?? .black) {
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        bottom.backgroundColor = color.cgColor
        layer.masksToBounds = true
        layer.addSublayer(bottom)
    }
    
    func removeFromSuperviewAnimated() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
}
