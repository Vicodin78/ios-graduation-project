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
        $0.alpha = 0.0
        return $0
    }(UIImageView())
    
    private let blurEffectView: UIVisualEffectView = {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.systemMaterialDark))
        blur.alpha = 0.0
        blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blur
    }()
    
    let image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.alpha = 0.2
        return $0
    }(UIImageView())
    
    private let profileExitFullScreen: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        $0.image = UIImage(systemName: "multiply")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .systemGray6
        $0.alpha = 0.0
        return $0
    }(UIImageView())
    
    private func tapGesturesExit() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapActionExit))
        profileExitFullScreen.addGestureRecognizer(tapGest)
    }

    @objc private func tapActionExit() {
        UIView.animate(withDuration: 0.2) {
            self.image.alpha = 0.0
            self.profileExitFullScreen.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.backView.alpha = 0.0
                self.blurEffectView.alpha = 0.0
            } completion: { _ in
                self.dismiss(animated: false)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        layout()
        tapGesturesExit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.backView.alpha = 0.7
            self.blurEffectView.alpha = 0.5
            self.image.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.profileExitFullScreen.alpha = 1.0
            }
        }
    }
    
    private func layout() {
        
        blurEffectView.frame = view.bounds
        
        [blurEffectView, backView, image, profileExitFullScreen].forEach { view.addSubview($0)}
        
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
