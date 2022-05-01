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
    
    private let logoImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo")
        return $0
    }(UIImageView())
    
    private let stackLogIn: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .systemGray6
        return stack
    }()
    
    private let loginTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Email of phone"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        return $0
    }(UITextField())
    
    private let lineBetweenTextFields: UIView = {
        $0.backgroundColor = .lightGray
        return $0
    }(UIView())
    
    private let passTextField: UITextField = {
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
    
    private let buttonLogIn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Log In", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor("#4885CC", alpha: 1)
//        $0.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)
//        $0.backgroundImage(for: .disabled)
//        $0.backgroundImage(for: .selected)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton())
    
    private func customLogInView() {
        view.backgroundColor = .white
        
        [loginTextField, lineBetweenTextFields, passTextField].forEach { stackLogIn.addArrangedSubview($0)}
        
        [logoImg, stackLogIn, buttonLogIn].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            logoImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: 100),
            logoImg.widthAnchor.constraint(equalToConstant: 100),
        
            stackLogIn.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: 120),
            stackLogIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackLogIn.heightAnchor.constraint(equalToConstant: 100),
            stackLogIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
       
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            lineBetweenTextFields.heightAnchor.constraint(equalToConstant: 0.5),
            
            buttonLogIn.topAnchor.constraint(equalTo: stackLogIn.bottomAnchor, constant: 16),
            buttonLogIn.leadingAnchor.constraint(equalTo: stackLogIn.leadingAnchor),
            buttonLogIn.trailingAnchor.constraint(equalTo: stackLogIn.trailingAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension UIColor {
  
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000")
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}
