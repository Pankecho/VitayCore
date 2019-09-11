//
//  Alerta.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public enum TipoAlerta: String {
    case ALERTA
    case WARNING
    case NORMAL
}

public class AlertaViewController: UIViewController {
    private var tipo: TipoAlerta = .NORMAL {
        didSet{
            switch tipo {
            case .ALERTA:
                color = UIColor(named: "RoseStrong") ?? .red
                break
            case .WARNING:
                color = UIColor(named: "Yellow") ?? .yellow
                break
            case .NORMAL:
                color = UIColor(named: "Inactive") ?? .black
                break
            }
        }
    }
    
    private var titulo: String = "Alerta"
    
    private var mensaje: String = "Mensaje"
    
    private var handler: normalHandler?
    
    private var yConstraint: NSLayoutConstraint?
    
    private var color: UIColor = .black
    
    private lazy var backgroundView: UIView = {
        let vista = UIView()
        vista.translatesAutoresizingMaskIntoConstraints = false
        vista.backgroundColor = UIColor(named: "DarkGray")
        vista.alpha = 0
        return vista
    }()
    
    private lazy var alertaWrapper: UIView = {
        let vista = UIView()
        vista.translatesAutoresizingMaskIntoConstraints = false
        vista.backgroundColor = .white
        vista.layer.cornerRadius = 12
        vista.clipsToBounds = true
        vista.layer.masksToBounds = true
        return vista
    }()
    
    private lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = titulo
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    private lazy var tituloWrapper: UIView = {
        let vista = UIView()
        vista.translatesAutoresizingMaskIntoConstraints = false
        vista.clipsToBounds = true
        vista.backgroundColor = color
        return vista
    }()
    
    private lazy var mensajeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = mensaje
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "Inactive")
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(UIColor(named: "Inactive"), for: .normal)
        button.setTitle(NSLocalizedString("Accept", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.setBorder(width: 1, color: color.cgColor)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        setupHeader()
        setupLabelButton()
        setupMainView()
    }
    
    private func setupBackgroundView() {
        view.backgroundColor = UIColor(named: "DarkGray")?.withAlphaComponent(0.5)
        view.addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupMainView() {
        view.addSubview(alertaWrapper)
        alertaWrapper.heightAnchor.constraint(equalToConstant: 200).isActive = true
        alertaWrapper.widthAnchor.constraint(equalToConstant: 300).isActive = true
        alertaWrapper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yConstraint = alertaWrapper.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -800)
        yConstraint?.isActive = true
        begin()
    }
    
    private func setupHeader() {
        tituloWrapper.addSubview(tituloLabel)
        tituloLabel.topAnchor.constraint(equalTo: tituloWrapper.topAnchor).isActive = true
        tituloLabel.leadingAnchor.constraint(equalTo: tituloWrapper.leadingAnchor).isActive = true
        tituloLabel.trailingAnchor.constraint(equalTo: tituloWrapper.trailingAnchor).isActive = true
        tituloLabel.bottomAnchor.constraint(equalTo: tituloWrapper.bottomAnchor).isActive = true
        
        alertaWrapper.addSubview(tituloWrapper)
        tituloWrapper.topAnchor.constraint(equalTo: alertaWrapper.topAnchor).isActive = true
        tituloWrapper.leadingAnchor.constraint(equalTo: alertaWrapper.leadingAnchor).isActive = true
        tituloWrapper.trailingAnchor.constraint(equalTo: alertaWrapper.trailingAnchor).isActive = true
        tituloWrapper.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupLabelButton() {
        // Button
        alertaWrapper.addSubview(actionButton)
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        actionButton.leadingAnchor.constraint(equalTo: alertaWrapper.leadingAnchor, constant: 20).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: alertaWrapper.trailingAnchor, constant: -20).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: alertaWrapper.bottomAnchor, constant: -20).isActive = true
        
        // Label
        alertaWrapper.addSubview(mensajeLabel)
        mensajeLabel.topAnchor.constraint(equalTo: tituloWrapper.bottomAnchor, constant: 20).isActive = true
        mensajeLabel.leadingAnchor.constraint(equalTo: alertaWrapper.leadingAnchor, constant: 20).isActive = true
        mensajeLabel.trailingAnchor.constraint(equalTo: alertaWrapper.trailingAnchor, constant: -20).isActive = true
        mensajeLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20).isActive = true
    }
    
    public func setData(title: String, message: String, tipe: TipoAlerta, handler: normalHandler?) {
        titulo = title
        mensaje = message
        tipo = tipe
        self.handler = handler
    }
    
    @objc func buttonTapped() {
        guard let manejador = handler else {
            exit()
            return
        }
        manejador()
        exit()
    }
    
    private func begin() {
        yConstraint?.constant = 0
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        })
    }
    
    private func exit() {
        yConstraint?.constant = 800
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.layoutIfNeeded()
            self?.view.alpha = 0
        }) { [weak self] (_) in
            self?.removeFromParent()
            self?.dismiss(animated: false)
        }
    }
}
