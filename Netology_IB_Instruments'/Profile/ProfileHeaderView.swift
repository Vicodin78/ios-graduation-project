//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
//    private let controller = ProfileViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        tapGestures()
        tapGesturesExit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var statusText: String?
    
    let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "panda")
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Hipster Panda"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        return titleLabel
    }()
    
    private let secondTitle: UILabel = {
        let secondTitle = UILabel()
        secondTitle.translatesAutoresizingMaskIntoConstraints = false
        secondTitle.text = "Waiting for something..."
        secondTitle.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        secondTitle.textColor = .gray
        return secondTitle
    }()
    
    private lazy var buttonAct: UIButton = {
        let buttonAct = UIButton()
        buttonAct.translatesAutoresizingMaskIntoConstraints = false
        buttonAct.backgroundColor = .systemBlue
        buttonAct.layer.cornerRadius = 14
        buttonAct.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonAct.layer.shadowRadius = 4
        buttonAct.layer.borderColor = UIColor.black.cgColor
        buttonAct.layer.shadowOpacity = 0.7
        buttonAct.setTitle("Set status", for: .normal)
        buttonAct.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return buttonAct
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Изменить статус"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
        
    private let viewForPresent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.alpha = 0.0
        return $0
    }(UIView())

    private let profileExitFullScreen: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        $0.image = UIImage(systemName: "multiply")
        $0.contentMode = .scaleAspectFit
        $0.alpha = 0.0
        $0.tintColor = .systemGray6
        return $0
    }(UIImageView())
    
    private func tapGestures() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.addGestureRecognizer(tapGest)
    }
    
    @objc private func tapAction() {
        avatarImageView.layer.borderWidth = 0
        UIView.animate(withDuration: 0.5) {
            self.viewForPresent.alpha = 0.7
            NSLayoutConstraint.deactivate(self.avatarConstreint)
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            NSLayoutConstraint.activate(self.avatarFullScrenConstraint)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.contentMode = .scaleAspectFit
            self.avatarImageView.clipsToBounds = false
            self.layoutIfNeeded()
            self.updateFocusIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.profileExitFullScreen.alpha = 1.0
            }
        }
    }
    
    private func tapGesturesExit() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapActionExit))
        profileExitFullScreen.addGestureRecognizer(tapGest)
    }

    @objc private func tapActionExit() {
        UIView.animate(withDuration: 0.3) {
            self.profileExitFullScreen.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.viewForPresent.alpha = 0.0
                self.avatarImageView.layer.cornerRadius = 50
                self.avatarImageView.layer.borderWidth = 3
                self.avatarImageView.contentMode = .scaleAspectFill
                self.avatarImageView.clipsToBounds = true
                NSLayoutConstraint.activate(self.avatarConstreint)
                NSLayoutConstraint.deactivate(self.avatarFullScrenConstraint)
                self.layoutIfNeeded()
            }
        }
    }
    
    private var avatarConstreint = [NSLayoutConstraint]()
    private var avatarFullScrenConstraint = [NSLayoutConstraint]()
    
    private let insetForAvatarImageView: CGFloat = 16
    private let widthHeightAvatarImageView: CGFloat = 100
    
    func layout() {
        
        viewForPresent.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        
        avatarConstreint = [
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: insetForAvatarImageView),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: insetForAvatarImageView),
            avatarImageView.widthAnchor.constraint(equalToConstant: widthHeightAvatarImageView),
            avatarImageView.heightAnchor.constraint(equalToConstant: widthHeightAvatarImageView)]
        
        avatarFullScrenConstraint = [
            avatarImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.9),
            avatarImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)]
        
        [titleLabel, secondTitle, buttonAct, textField, viewForPresent, avatarImageView, profileExitFullScreen].forEach{addSubview($0)}
        
        NSLayoutConstraint.activate(avatarConstreint)
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20 + insetForAvatarImageView + widthHeightAvatarImageView),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            secondTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            secondTitle.bottomAnchor.constraint(equalTo: buttonAct.topAnchor, constant: -64),
            secondTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            buttonAct.topAnchor.constraint(equalTo: topAnchor, constant: 36 + insetForAvatarImageView + widthHeightAvatarImageView),
            buttonAct.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAct.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonAct.heightAnchor.constraint(equalToConstant: 50),
            buttonAct.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        
            textField.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 12),
            textField.leadingAnchor.constraint(equalTo: secondTitle.leadingAnchor, constant: -3),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.trailingAnchor.constraint(equalTo: buttonAct.trailingAnchor),
            
            viewForPresent.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            viewForPresent.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            profileExitFullScreen.heightAnchor.constraint(equalToConstant: 40),
            profileExitFullScreen.widthAnchor.constraint(equalToConstant: 40),
            profileExitFullScreen.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            profileExitFullScreen.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
    }
    
    @objc private func buttonPressed() {
        secondTitle.text = statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}
