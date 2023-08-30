//
//  HomeScreen.swift
//  AraucariasDoBrasil
//
//  Created by Ricardo Massaki on 29/08/23.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedStartButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradient background")
        return image
        
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "araucariaLogo")
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    lazy var pageNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35)
        label.text = "Araucárias do Brasil"
        return label
        
    }()
    
    lazy var subLoginView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gradient background")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
        
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        return button
        
    }()
    
    @objc func tappedStartButton() {
        delegate?.tappedStartButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.pageNameLabel)
        self.addSubview(self.subLoginView)
        self.addSubview(self.startButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.pageNameLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 16),
            self.pageNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.startButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            self.startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.startButton.heightAnchor.constraint(equalToConstant: 44),
            
            self.subLoginView.leadingAnchor.constraint(equalTo: self.startButton.leadingAnchor),
            self.subLoginView.trailingAnchor.constraint(equalTo: self.startButton.trailingAnchor),
            self.subLoginView.topAnchor.constraint(equalTo: self.startButton.topAnchor),
            self.subLoginView.bottomAnchor.constraint(equalTo: self.startButton.bottomAnchor),
            
            
        
        ])
    }
    
}
