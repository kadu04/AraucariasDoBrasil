//
//  LoginViewController.swift
//  AraucariasDoBrasil
//
//  Created by Ricardo Massaki on 30/08/23.
//

import UIKit

class LoginViewController: UIViewController {

    var screen: LoginScreen?
    var alert: Alert?
    
    override func loadView() {
        self.screen = LoginScreen()
        self.view = self.screen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
        self.navigationItem.hidesBackButton = true
    }
}

extension LoginViewController: LoginScreenDelegate {
    func tappedBackButton() {
        let viewcontroller = HomeViewController()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}

