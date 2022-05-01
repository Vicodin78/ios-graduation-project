//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 28.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let indent = UIScreen.main.bounds.height * 0.1
    private let width = UIScreen.main.bounds.width
    private let heigth = UIScreen.main.bounds.height
    
    private var statusText: String?
    
    private let secondTitle: UILabel = {
        let secondTitle = UILabel(frame: CGRect(x: 135, y: 82, width: 200, height: 16))
        secondTitle.text = "Waiting for something..."
        secondTitle.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        secondTitle.textColor = .gray
        return secondTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        custom()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func custom() {
        
        let myView: UIView = {
            let myView = UIView(frame: CGRect(x: 0, y: indent, width: width, height: heigth - indent))
            myView.backgroundColor = UIColor.lightGray
            return myView
        }()
        addSubview(myView)
        
        let myImageView: UIImageView = {
            let myImageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
            myImageView.image = UIImage(named: "panda")
            myImageView.layer.cornerRadius = 50
            myImageView.contentMode = .scaleAspectFill
            myImageView.layer.borderWidth = 3
            myImageView.layer.borderColor = UIColor.white.cgColor
            myImageView.clipsToBounds = true
            return myImageView
        }()
        myView.addSubview(myImageView)
        
        let titleLabel: UILabel = {
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 27, width: width, height: 40))
            titleLabel.text = "Hipster Panda"
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
            titleLabel.textAlignment = .center
            return titleLabel
        }()
        myView.addSubview(titleLabel)
        
        let buttonAct: UIButton = {
            let buttonAct = UIButton(frame: CGRect(x: 16, y: 162, width: width - 32, height: 50))
            buttonAct.backgroundColor = .systemBlue
            buttonAct.layer.cornerRadius = 14
            buttonAct.layer.shadowOffset = CGSize(width: 4, height: 4)
            buttonAct.layer.shadowRadius = 4
            buttonAct.layer.borderColor = UIColor.black.cgColor
            buttonAct.layer.shadowOpacity = 0.7
            buttonAct.setTitle("Show status", for: .normal)
            buttonAct.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            return buttonAct
        }()
        myView.addSubview(buttonAct)
        
        let textField: UITextField = {
            let textField = UITextField(frame: CGRect(x: 133, y: 112, width: 200, height: 40))
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 12
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.text = ""
            textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textField.textColor = .black
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftViewMode = .always
            textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
            return textField
        }()
        myView.addSubview(textField)
        myView.addSubview(secondTitle)
    }
    
    @objc private func buttonPressed() {
        secondTitle.text = statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}
