//
//  EmptyState.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/5/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import UIKit

public protocol Nib {
    var tagNib: String { get }
    func load()
}

public class EmptyState: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imagen: UIImageView = {
        let imagen = UIImageView()
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.contentMode = .scaleAspectFill
        return imagen
    }()
    
    private lazy var header: UIView = {
        let vista = UIView()
        vista.translatesAutoresizingMaskIntoConstraints = false
        vista.addSubview(titleLabel)
        titleLabel.trailingAnchor.constraint(equalTo: vista.trailingAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: vista.leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: vista.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: vista.bottomAnchor).isActive = true
        return vista
    }()
    
    private lazy var footer: UIView = {
        let vista = UIView()
        vista.translatesAutoresizingMaskIntoConstraints = false
        vista.addSubview(descriptionLabel)
        descriptionLabel.trailingAnchor.constraint(equalTo: vista.trailingAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: vista.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: vista.topAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: vista.bottomAnchor).isActive = true
        return vista
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 0
        stack.addArrangedSubview(header)
        header.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        stack.addArrangedSubview(imagen)
        imagen.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imagen.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stack.addArrangedSubview(footer)
        footer.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        return stack
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadUI()
    }
    
    private func loadUI() {
        addSubview(stack)
        stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
    
    public func setColor(_ color: UIColor) {
        titleLabel.textColor = color
        descriptionLabel.textColor = color
    }
    
    public func setData(title: String?, imagen: String, description: String?) {
        DispatchQueue.main.async {
            self.titleLabel.text = title
            self.imagen.image = UIImage(named: imagen)
            self.descriptionLabel.text = description
        }
    }
}

