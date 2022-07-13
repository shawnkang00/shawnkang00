//
//  LoginViewController.swift
//  mingle
//
//  Created by Jong on 2022/07/11.
//

import Foundation
import UIKit


final class LoginViewController: UIViewController {
    static let identifier = "LoginViewController"
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 24)
        label.text = "로그인"
        label.numberOfLines = 1
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = InsetTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "학교 이메일 주소"
        textField.font = UIFont(name: "PretendardVariable-Regular", size: 16)
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        return textField
    }()
    
    private let emailSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
        return view
    }()
        
    private let passwordTextField: UITextField = {
        let textField = InsetTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "PretendardVariable-Regular", size: 16)
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let passwordSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
        return view
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        label.attributedText = NSMutableAttributedString(string: "회원가입", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.numberOfLines = 1
        return label
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1)
        label.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        label.attributedText = NSMutableAttributedString(string: "비밀번호를 잊으셨나요?", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.numberOfLines = 1
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "PretendardVariable-Regular", size: 14)
        button.setTitleColor(UIColor(red: 0.408, green: 0.408, blue: 0.408, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 0.812, green: 0.812, blue: 0.812, alpha: 1)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.loginLabel)
        self.view.addSubview(self.emailTextField)
        self.view.addSubview(self.emailSeparator)
        self.view.addSubview(self.passwordTextField)
        self.view.addSubview(self.passwordSeparator)
        self.view.addSubview(self.signUpLabel)
        self.view.addSubview(self.forgotPasswordLabel)
        self.view.addSubview(self.loginButton)

        
        NSLayoutConstraint.activate([
            self.loginLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 144),
            self.loginLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 90),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 34),
            
            self.emailSeparator.heightAnchor.constraint(equalToConstant: 1),
            self.emailSeparator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            self.emailSeparator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            self.emailSeparator.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 57),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 34),
            
            self.passwordSeparator.heightAnchor.constraint(equalToConstant: 1),
            self.passwordSeparator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            self.passwordSeparator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            self.passwordSeparator.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            
            self.signUpLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            self.signUpLabel.topAnchor.constraint(equalTo: self.passwordSeparator.bottomAnchor, constant: 16),
            
            self.forgotPasswordLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.forgotPasswordLabel.topAnchor.constraint(equalTo: self.passwordSeparator.bottomAnchor, constant: 113),
            
            self.loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -74),
            self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            self.loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            self.loginButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
}
