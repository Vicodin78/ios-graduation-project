//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var statusText: String?
    
    private let myView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "panda")
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
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
    
    private func layout() {
        
        [myView, avatarImageView, titleLabel, secondTitle, buttonAct, textField].forEach{addSubview($0)}
        
        NSLayoutConstraint.activate([
        
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            

            secondTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            secondTitle.bottomAnchor.constraint(equalTo: buttonAct.topAnchor, constant: -64),
            secondTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            buttonAct.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
            buttonAct.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonAct.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonAct.heightAnchor.constraint(equalToConstant: 50),
            buttonAct.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        
            textField.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 12),
            textField.leadingAnchor.constraint(equalTo: secondTitle.leadingAnchor, constant: -3),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.trailingAnchor.constraint(equalTo: buttonAct.trailingAnchor)
        ])
    }
    
    
    @objc private func buttonPressed() {
        secondTitle.text = statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}
