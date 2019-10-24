//
//  CustomAlert.swift
//  VitayCore
//
//  Created by Juan Pablo on 10/24/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public class CustomAlert: UIView {
    
    public static let shared = CustomAlert()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertaWrapperView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    private var acceptHandler: normalHandler?
    
    private var cancelHandler: normalHandler?
    
    private var completionHandler: normalHandler?

    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        parentView.frame = UIScreen.main.bounds
    }
    
    public func showAlertaDefault(_ title: String, _ message: String) {
        clean()
        titleLabel.text = title
        messageLabel.text = message
        cancelButton.isHidden = true
        
        DispatchQueue.main.async {[weak self] in
            UIApplication.shared.keyWindow?.addSubViewAnimated(vista: self?.parentView ?? UIView())
        }
    }
    
    public func showAlertaWithCustomHandler(_ title: String, _ message: String, _ opcionAccept: String, _ handlerOk: normalHandler?) {
        clean()
        titleLabel.text = title
        messageLabel.text = message
        cancelButton.isHidden = true
        acceptHandler = handlerOk
        
        DispatchQueue.main.async {[weak self] in
            UIApplication.shared.keyWindow?.addSubViewAnimated(vista: self?.parentView ?? UIView())
        }
    }
    
    public func showAlertaWithOneOptionCustomHandler(_ title: String, _ message: String, _ opcionAccept: String, _ handlerOk: normalHandler?) {
        clean()
        titleLabel.text = title
        messageLabel.text = message
        cancelButton.isHidden = false
        acceptHandler = handlerOk
        
        DispatchQueue.main.async {[weak self] in
            UIApplication.shared.keyWindow?.addSubViewAnimated(vista: self?.parentView ?? UIView())
        }
    }
    
    private func clean() {
        let color = UIColor(named: "Inactive") ?? .black
        let red = UIColor(named: "RoseStrong") ?? .red
        titleLabel.textColor = color
        acceptButton.setTitleColor(color, for: .normal)
        cancelButton.setTitleColor(red, for: .normal)
        cancelHandler = nil
        acceptHandler = nil
        completionHandler = nil
        titleLabel.text = ""
        messageLabel.text = ""
        acceptButton.setTitle(NSLocalizedString("Accept", comment: ""), for: .normal)
        cancelButton.setTitle(NSLocalizedString("Cancel", comment: ""), for: .normal)
    }
    
    @IBAction private func acceptButtonAction(_ sender: UIButton) {
        acceptHandler?()
        exit()
    }
    
    @IBAction private func cancelButtonAction(_ sender: UIButton) {
        cancelHandler?()
        exit()
    }
    
    private func exit() {
        parentView.removeFromSuperviewAnimated()
        completionHandler?()
    }
}

enum AlertType {
    case Danger
    case Normal
    case Success
}
