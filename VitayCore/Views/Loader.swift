//
//  Loader.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import Lottie

public class Loader: UIView {
    
    private lazy var cargador: AnimationView = {
        let animation = AnimationView(animation: Animation.named("white"))
        animation.loopMode = .loop
        animation.contentMode = .scaleAspectFill
        animation.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return animation
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAnimation()
    }
    
    public static func instanciateLoader(view: UIView) -> Loader{
        let load = Loader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(load)
        return load
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAnimation(){
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.backgroundColor = UIColor(named: "Inactive")?.withAlphaComponent(0.8)
        
        let animation = cargador
        animation.play()
        self.addSubview(blurView)
        self.addSubview(animation)
        
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        animation.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        animation.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animation.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.layoutIfNeeded()
    }
    
    public func remove(){
        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            self?.alpha = 0
        }) {[weak self] (_) in
            self?.removeFromSuperview()
        }
    }
}
