//
//  RecoverPasswordViewController.swift
//  AraucariasDoBrasil
//
//  Created by Ricardo Massaki on 30/08/23.
//

import UIKit
import Firebase

class RecoverPasswordViewController: UIViewController {
    
    var screenView = RecoverPasswordScreen()
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        screenView = RecoverPasswordScreen()
        view = screenView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.auth = Auth.auth()
        alert = Alert(controller: self)
        self.navigationItem.hidesBackButton = true
        screenView.delegate(delegate: self)

    }
}

extension RecoverPasswordViewController: RecoverPasswordScreenDelegate {
    func tappedBackButton() {
        let viewcontroller = LoginViewController()
        self.navigationController?.popViewController(animated: true)
    }
    
    func tappedSendButton() {
        let email = screenView.emailTextField
        
        self.auth?.sendPasswordReset(withEmail: email.text ?? "", completion: { error in
            if let error {
                self.alert?.configAlert(title: AlertTexts.errorTitle.rawValue, message: AlertTexts.errorEmail.rawValue, secondButton: false)
            } else {
                self.alert?.configAlert(title: AlertTexts.succeeded.rawValue, message: AlertTexts.titleSucceeded.rawValue, secondButton: false)
                
            }
        })
    }
}
