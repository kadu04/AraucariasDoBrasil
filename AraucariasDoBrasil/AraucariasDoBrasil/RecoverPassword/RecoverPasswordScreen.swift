//
//  RecoverScreen.swift
//  AraucariasDoBrasil
//
//  Created by Ricardo Massaki on 30/08/23.
//

import UIKit

protocol RecoverPasswordScreenDelegate: AnyObject {
    func tappedSendButton()
    func tappedBackButton()
    
}

class RecoverPasswordScreen: UIView {
    
    private weak var delegate: RecoverPasswordScreenDelegate?
    
    public func delegate(delegate: RecoverPasswordScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "goback-button"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }

    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradient background")
        image.contentMode = .scaleAspectFill
        return image
        
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "araucaria-tree")
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    lazy var pageNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.text = "Araucárias do Brasil"
        return label
        
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Qual seu e-mail?"
        return label
        
    }()
    lazy var emailTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .emailAddress
        txt.attributedPlaceholder = NSAttributedString(string: "Digite seu email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(0.4)])
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        return txt
        
    }()
    
    lazy var sendEmailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENVIAR", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedSendButton() {
        delegate?.tappedSendButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.backButton)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.pageNameLabel)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.sendEmailButton)
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configConstraint() {
        NSLayoutConstraint.activate([
            
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -15),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 160),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 160),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.pageNameLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 16),
            self.pageNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.pageNameLabel.bottomAnchor, constant: 50),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 5),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.sendEmailButton.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 60),
            self.sendEmailButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.sendEmailButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            self.sendEmailButton.heightAnchor.constraint(equalToConstant: 40),
        
        
        
        
        ])
    }
}
