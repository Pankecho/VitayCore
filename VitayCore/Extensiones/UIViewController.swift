//
//  UIViewController.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public extension UIViewController {
    
    func forceCloseEdit(){
        self.view.endEditing(true)
    }
    
    func showAlertaDefault(_ title: String, _ message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: NSLocalizedString("Accept", comment: ""), style: .default, handler: nil))
        DispatchQueue.main.async {[weak self] in
            self?.present(ac, animated: true, completion: nil)
        }
    }
    
    func showAlertaWithCustomHandler(_ title: String, _ message: String, _ mensaje: String , handlerOk: normalHandler?){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: mensaje, style: .default) { (_) in
            handlerOk?()
        }
        ac.addAction(action)
        DispatchQueue.main.async {[weak self] in
            self?.present(ac, animated: true, completion: nil)
        }
    }
    
    func showAlertaDosOpcionesWithCompletion(_ title: String, _ message: String, _ messageOpcion: String, handlerOpcion: normalHandler?, completion: normalHandler?){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: messageOpcion, style: .default) { (_) in
            handlerOpcion?()
        }
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        ac.addAction(cancel)
        ac.addAction(action)
        DispatchQueue.main.async {[weak self] in
            self?.present(ac, animated: true) {
                completion?()
            }
        }
    }
    
    func showAlertaDosOpcionesWithHandler(_ title: String, _ message: String, _ messageOpcion: String, _ cancelOpcion: String = NSLocalizedString("Cancel", comment: ""), messageHandler: normalHandler?, cancelHandler: normalHandler?){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: messageOpcion, style: .default) { (_) in
            messageHandler?()
        }
        let cancel = UIAlertAction(title: cancelOpcion, style: .cancel) { (_) in
            cancelHandler?()
        }
        ac.addAction(cancel)
        ac.addAction(action)
        DispatchQueue.main.async {[weak self] in
            self?.present(ac, animated: true)
        }
    }
    
    func showAlertaActionSheetCamera(_ title: String, cameraHandler: normalHandler?, pickerHandler: normalHandler?) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            ac.addAction(UIAlertAction(title: NSLocalizedString("Camera", comment: ""), style: .default, handler: { (_) in
                cameraHandler?()
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            ac.addAction(UIAlertAction(title: NSLocalizedString("PhotoAlbum", comment: ""), style: .default, handler: { (_) in
                pickerHandler?()
            }))
        }
        ac.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        DispatchQueue.main.async {[weak self] in
            self?.present(ac, animated: true, completion: nil)
        }
    }
    
    func showAlertaWithTextField(_ title: String, _ message: String, handler: dataHandler<String>?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addTextField { (textfield) in
            textfield.placeholder = title
        }
        ac.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        ac.addAction(UIAlertAction(title: NSLocalizedString("Accept", comment: ""), style: .default, handler: { (_) in
            let cadena = ac.textFields?.first?.text ?? ""
            handler?(cadena, nil)
        }))
        DispatchQueue.main.async {[weak self] in
            self?.present(ac, animated: true, completion: nil)
        }
    }
    
    func enableDisableButtonInNavigationBar(_ dato: Bool){
        navigationController?.navigationItem.leftBarButtonItem?.isEnabled = dato
        navigationController?.navigationItem.rightBarButtonItem?.isEnabled = dato
        navigationItem.hidesBackButton = !dato
    }
    
    func instanciateViewController(with name: String, storyboard: String) -> UIViewController {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func setTitle(title: String){
        navigationItem.title = title
    }
    
    func setBackButton(title: String = "Back"){
        let backbutton = UIBarButtonItem()
        backbutton.title = title
        navigationController?.navigationBar.topItem?.backBarButtonItem = backbutton
    }
    
    func animateAppearView(view: UIView, time: TimeInterval, appear: Bool = true, completion: normalHandler?) {
        UIView.animate(withDuration: time, animations: {
            view.alpha = appear ? 1 : 0
        }, completion: { (_) in
            completion?()
        })
    }
}
