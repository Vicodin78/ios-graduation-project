//
//  LogInViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customLogInView()
    }
    
    let logoImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo")
        return $0
    }(UIImageView())
    
    let stackLogIn: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .systemGray6
//        stack.distribution = .fillEqually
        return stack
    }()
    
    let loginTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Email of phone"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        return $0
    }(UITextField())
    
    let line: UIView = {
        $0.backgroundColor = .lightGray
        return $0
    }(UIView())
    
    let passTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Password"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.isSecureTextEntry = true
        return $0
    }(UITextField())
    
    private func customLogInView() {
        view.backgroundColor = .white
        
        [loginTextField, line, passTextField].forEach { stackLogIn.addArrangedSubview($0)}
        
        [logoImg, stackLogIn].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            logoImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: 100),
            logoImg.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            stackLogIn.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: 120),
            stackLogIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackLogIn.heightAnchor.constraint(equalToConstant: 100),
            stackLogIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            line.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
    }
}
