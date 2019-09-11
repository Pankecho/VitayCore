//
//  StartLoader.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/10/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation
import Lottie
import UIKit

public class StartView: UIView {
    
    private lazy var imagenBackground: UIImageView = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.contentMode = .scaleAspectFill
        imagen.image = UIImage(named: "splashBackground")
        return imagen
    }()
    
    private lazy var animationLoader: AnimationView = {
        let animation = Animation.named("blue")
        let vista = AnimationView(animation: animation)
        vista.translatesAutoresizingMaskIntoConstraints = false
        vista.loopMode = .loop
        vista.backgroundColor = .clear
        vista.contentMode = .scaleAspectFill
        return vista
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        initiate()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        initiate()
    }
    
    private func setupUI() {
        addSubview(imagenBackground)
        imagenBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imagenBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imagenBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imagenBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(animationLoader)
        animationLoader.widthAnchor.constraint(equalToConstant: 200).isActive = true
        animationLoader.heightAnchor.constraint(equalToConstant: 200).isActive = true
        animationLoader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationLoader.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func initiate() {
        animationLoader.play()
    }
}
