//
//  PresentPostViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 20.05.2022.
//

import UIKit

class PresentPostViewController: UIViewController {
    
    let imageViewPost: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    let descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 15
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .darkGray
        $0.textAlignment = .justified
        return $0
    }(UILabel())
    
    private func layout() {
        
        [imageViewPost, descriptionLabel].forEach{view.addSubview($0)}
        
        let insert: CGFloat = 16
        let widthHeight: CGFloat = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            
            imageViewPost.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageViewPost.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageViewPost.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageViewPost.widthAnchor.constraint(equalToConstant: widthHeight),
            imageViewPost.heightAnchor.constraint(equalToConstant: widthHeight),

            descriptionLabel.topAnchor.constraint(equalTo: imageViewPost.bottomAnchor, constant: insert),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageViewPost.leadingAnchor, constant: insert),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageViewPost.trailingAnchor,constant: -insert)
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
