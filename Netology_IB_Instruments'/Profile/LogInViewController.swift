//
//  LogInViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let notifCenter = NotificationCenter.default
    
    private let arrayOfAccounts: [String: String] = ["Ivan": "6021023", "ivan@mail.ru": "12345678"]
    
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
        stack.tintColor = UIColor(named: "AccentColor")
        return stack
    }()
    
    private lazy var loginTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Email of phone"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.delegate = self
        return $0
    }(UITextField())
    
    private let lineBetweenTextFields: UIView = {
        $0.backgroundColor = .lightGray
        return $0
    }(UIView())
    
    private lazy var passTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Password"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.delegate = self
        $0.isSecureTextEntry = true
        return $0
    }(UITextField())
    
    private lazy var buttonLogIn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Log In", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        let imgNormal = UIImage(named: "blue_pixel")!.alpha(1.0)
        let imgOther = UIImage(named: "blue_pixel")!.alpha(0.8)
        $0.setBackgroundImage(imgNormal, for: .normal)
        $0.setBackgroundImage(imgOther, for: .selected)
        $0.setBackgroundImage(imgOther, for: .highlighted)
        $0.setBackgroundImage(imgOther, for: .disabled)
        $0.addTarget(self, action: #selector(activeLogIn), for: .touchUpInside)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(UIButton())
    
    private let shortPassword: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Password must contain 6 or more characters!"
        $0.textAlignment = .center
        $0.textColor = .red
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.alpha = 0.0
        return $0
    }(UILabel())
    
    private let incorrectImail: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Invalid email format!"
        $0.textAlignment = .center
        $0.textColor = .red
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.alpha = 0.0
        return $0
    }(UILabel())
    
    private func redBorderForTextField() {
        UIView.animate(withDuration: 0.2) {
            self.stackLogIn.layer.borderWidth = 1
            self.stackLogIn.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    private func errorPassTextField() {
        let passBounds = passTextField.bounds
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6, options: .curveEaseInOut) {
            self.passTextField.bounds = CGRect(x: passBounds.origin.x + 15, y: passBounds.origin.y, width: passBounds.width, height: passBounds.height)
        }
    }
    
    private func errorLoginTextField() {
        let loginBounds = loginTextField.bounds
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6, options: .curveEaseInOut) {
            self.loginTextField.bounds = CGRect(x: loginBounds.origin.x + 15, y: loginBounds.origin.y, width: loginBounds.width, height: loginBounds.height)
        }
    }
    
    private func verification() -> Bool {
        var returnValue = Bool()
        for i in arrayOfAccounts {
            if loginTextField.text == i.key && passTextField.text == i.value {
                returnValue = true
            }
        }
        return returnValue
    }
    
    private func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    private func incorrectLoginPass() {
        let alertWindow = UIAlertController(title: "Неверные данные!", message: "Пожалуйста проверьте правильность введенных вами данных.", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .default)
        alertWindow.addAction(alertButton)
        present(alertWindow, animated: true)
    }
    
    @objc private func activeLogIn() {
        if passTextField.text == "" {
            redBorderForTextField()
            errorPassTextField()
            passTextField.becomeFirstResponder()
        } else {
            if passTextField.text?.count ?? 0 < 6 {
                redBorderForTextField()
                UIView.animate(withDuration: 0.2) {
                    self.shortPassword.alpha = 1.0
                } completion: { _ in
                    self.errorPassTextField()
                }
            }
        }
        if loginTextField.text == "" {
            redBorderForTextField()
            errorLoginTextField()
            loginTextField.becomeFirstResponder()
        } else {
            if let login = loginTextField.text {
                if isValidEmail(testStr: login) {
                    if verification() {
                        let profileVC = ProfileViewController()
                        navigationController?.pushViewController(profileVC, animated: true)
                    } else {
                        if passTextField.text?.count ?? 0 >= 6 {
                            incorrectLoginPass()
                        }
                    }
                } else {
                    redBorderForTextField()
                    UIView.animate(withDuration: 0.2) {
                        self.incorrectImail.alpha = 1.0
                    } completion: { _ in
                        self.errorLoginTextField()
                    }
                }
            }
        }
    }
    
    private func tapGesturesForView() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        view.addGestureRecognizer(tapGest)
    }
    
    @objc private func tapAction() {
        view.endEditing(true)
    }
    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customLogInView()
        tapGesturesForView()
        self.loginTextField.addTarget(self, action: #selector(textFieldChangedCheck), for: .editingChanged)
        self.passTextField.addTarget(self, action: #selector(textFieldChangedCheck), for: .editingChanged)
    }
    
    @objc private func textFieldChangedCheck(sender: UITextField) {
        if sender.text != "" {
            UIView.animate(withDuration: 0.2) {
                self.stackLogIn.layer.borderWidth = 0.5
                self.stackLogIn.layer.borderColor = UIColor.lightGray.cgColor
                self.shortPassword.alpha = 0.0
                self.incorrectImail.alpha = 0.0
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notifCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notifCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        notifCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notifCenter.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.5) {
            self.scrollView.contentInset = .zero
            self.scrollView.verticalScrollIndicatorInsets = .zero
        }
    }
    
    private func customLogInView() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [logoImg, stackLogIn, shortPassword, incorrectImail, buttonLogIn].forEach { contentView.addSubview($0) }
        
        [loginTextField, lineBetweenTextFields, passTextField].forEach { stackLogIn.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: 100),
            logoImg.widthAnchor.constraint(equalToConstant: 100),
        
            stackLogIn.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: 120),
            stackLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackLogIn.heightAnchor.constraint(equalToConstant: 100),
            stackLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
       
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            lineBetweenTextFields.heightAnchor.constraint(equalToConstant: 0.5),
            
            shortPassword.leadingAnchor.constraint(equalTo: stackLogIn.leadingAnchor),
            shortPassword.trailingAnchor.constraint(equalTo: stackLogIn.trailingAnchor),
            shortPassword.topAnchor.constraint(equalTo: stackLogIn.bottomAnchor, constant: 2),
            
            incorrectImail.bottomAnchor.constraint(equalTo: stackLogIn.topAnchor, constant: -2),
            incorrectImail.leadingAnchor.constraint(equalTo: stackLogIn.leadingAnchor),
            incorrectImail.trailingAnchor.constraint(equalTo: stackLogIn.trailingAnchor),
            
            buttonLogIn.topAnchor.constraint(equalTo: stackLogIn.bottomAnchor, constant: 16),
            buttonLogIn.leadingAnchor.constraint(equalTo: stackLogIn.leadingAnchor),
            buttonLogIn.trailingAnchor.constraint(equalTo: stackLogIn.trailingAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            buttonLogIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if loginTextField.text != "" && passTextField.isFirstResponder {
            activeLogIn()
        }
        if loginTextField.text != "" {
            passTextField.becomeFirstResponder()
        }
        return true
    }
}
