//
//  FeedViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 24.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let secondPost = Post(title: "PostViewController")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        buttonFeedVC()
    }
    
    private func buttonFeedVC() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.center = view.center
        button.setTitle("PostVC", for: .normal)
        button.backgroundColor = .magenta
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapButton() {
        let postVC = PostViewController()
        postVC.post = secondPost
        navigationController?.pushViewController(postVC, animated: true)
    }
}
