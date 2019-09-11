//
//  AccessLocation.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public class NotAccessLocationView: UIView{
    private lazy var header: UIView = {
        let vista = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        vista.translatesAutoresizingMaskIntoConstraints = false
        
        vista.backgroundColor = UIColor(named: "Rojo")
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor.white
        
        vista.addSubview(label)
        label.centerXAnchor.constraint(equalTo: vista.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: vista.safeAreaLayoutGuide.centerYAnchor).isActive = true
        vista.layoutIfNeeded()
        return vista
    }()
    
    private lazy var accessDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor(named: "Inactive") ?? UIColor.black
        label.text = NSLocalizedString("VitayNeedAccess", comment: "")
        return label
    }()
    
    private lazy var iconButton: UIButton = {
        let boton = UIButton()
        boton.translatesAutoresizingMaskIntoConstraints = false
        boton.setImage(UIImage(named: "center"), for: .normal)
        boton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        return boton
    }()
    
    private lazy var labelButton: UIButton = {
        let boton = BouncingButton()
        boton.canVibrate = false
        boton.translatesAutoresizingMaskIntoConstraints = false
        boton.setTitle(NSLocalizedString("GoSettings", comment: ""), for: .normal)
        boton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        boton.setTitleColor(UIColor.white, for: .normal)
        boton.layer.cornerRadius = 12
        boton.layer.masksToBounds = true
        boton.backgroundColor = UIColor(named: "Inactive")
        boton.layer.shadowOffset = CGSize(width: 0, height: 2)
        boton.layer.shadowOpacity = 0.5
        boton.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        return boton
    }()
    
    public static func instantiate(vista: UIView) -> NotAccessLocationView{
        let view = NotAccessLocationView(frame: vista.bounds)
        vista.addSubview(view)
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openSettings(){
        guard let settings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(settings) else {
            return
        }
        UIApplication.shared.open(settings)
    }
    
    private func setupUI(){
        backgroundColor = UIColor.white
        // Label
        addSubview(accessDescriptionLabel)
        accessDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        accessDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        accessDescriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // Icono
        addSubview(iconButton)
        iconButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconButton.bottomAnchor.constraint(equalTo: accessDescriptionLabel.topAnchor, constant: -20).isActive = true
        
        //Button
        addSubview(labelButton)
        labelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        labelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        labelButton.topAnchor.constraint(equalTo: accessDescriptionLabel.bottomAnchor, constant: 20).isActive = true
        
        layoutIfNeeded()
    }
    
    public func remove(){
        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            self?.alpha = 0
        }) { [weak self](_) in
            self?.removeFromSuperview()
        }
    }
}
