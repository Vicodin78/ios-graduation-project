//
//  PostViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 24.04.2022.
//

import UIKit

struct Post {
    var title: String
}

class PostViewController: UIViewController {
    
    var post: Post?
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        if let post = post {
            title = post.title
        }
        view.backgroundColor = .systemMint
        makeBarButton()
    }
    
    private func makeBarButton() {
        let buttonBar = UIBarButtonItem(title: "InfoView", style: .plain, target: self, action: #selector(tapButtonBar))
        navigationItem.rightBarButtonItem = buttonBar
    }
    
    @objc private func tapButtonBar() {
        let vc = InfoViewController()
        let vcNav = UINavigationController(rootViewController: vc)//для отображения title
        present(vcNav, animated: true)
    }
}
