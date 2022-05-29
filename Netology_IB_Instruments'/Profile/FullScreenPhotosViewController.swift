//
//  FullScreenPhotosViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 20.05.2022.
//

import UIKit

class FullScreenPhotosViewController: UIViewController {
    
    private let backView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.alpha = 0.7
        return $0
    }(UIImageView())
    
    let image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let profileExitFullScreen: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        $0.image = UIImage(systemName: "multiply")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .systemGray6
        return $0
    }(UIImageView())
    
    private func tapGesturesExit() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapActionExit))
        profileExitFullScreen.addGestureRecognizer(tapGest)
    }

    @objc private func tapActionExit() {
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        layout()
        tapGesturesExit()
    }
    
    private func layout() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.5
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        [backView, blurEffectView, image, profileExitFullScreen].forEach { view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            profileExitFullScreen.heightAnchor.constraint(equalToConstant: 40),
            profileExitFullScreen.widthAnchor.constraint(equalToConstant: 40),
            profileExitFullScreen.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            profileExitFullScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
    }
}
