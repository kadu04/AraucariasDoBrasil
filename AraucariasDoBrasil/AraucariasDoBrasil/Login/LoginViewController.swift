//
//  LoginViewController.swift
//  AraucariasDoBrasil
//
//  Created by Ricardo Massaki on 30/08/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    var screen = LoginScreen()
    var alert: Alert?
    var auth: Auth?
    
    override func loadView() {
        super.loadView()
//        self.screen = LoginScreen()
        self.view = self.screen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screen.delegate(delegate: self)
        self.auth = Auth.auth()
        self.navigationItem.hidesBackButton = true
    }
}

extension LoginViewController: LoginScreenDelegate {
    func tappedRegisterButton() {
        let viewcontroller = RegisterViewController()
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    
    
    func tappedRecoverPasswordButton() {
        let viewcontroller = RecoverPasswordViewController()
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func tappedBackButton() {
        let viewcontroller = HomeViewController()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func tappedLoginButton() {
        makeLogin()
    }
    
    private func makeLogin() {
        let email = screen.loginTextField
        let password = screen.passwordTextField
        
        auth?.signIn(withEmail: email.text ?? "", password: password.text ?? "", completion: { ( usuario, error ) in
            
            if error != nil {
                self.alert?.configAlert(title: AlertTexts.errorTitle.rawValue, message: AlertTexts.emptyFields.rawValue, secondButton: false)
                print("Falha ao logar: \(error?.localizedDescription ?? "")")
            } else {
                if usuario == nil {
                    self.alert?.configAlert(title: AlertTexts.errorTitle.rawValue, message: AlertTexts.dataIncorrect.rawValue, secondButton: false)
                } else {
                    print("Sucesso Login!!!")
                    
                }
            }
        })
    }
    
    
}

