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
        view.backgroundColor = .systemGray4
//        buttonFeedVC()
        layoutStack()
    }
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private func layoutStack() {
        view.addSubview(stackView)
        
        [firstButtonFeedVC, secondButtonFeedVC].forEach {stackView.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    let firstButtonFeedVC: UIButton = {
        let button = UIButton()
        button.setTitle("PostVC", for: .normal)
        button.backgroundColor = .systemCyan
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    let secondButtonFeedVC: UIButton = {
        let button = UIButton()
        button.setTitle("PostVCtoo", for: .normal)
        button.backgroundColor = .systemCyan
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()

    @objc private func tapButton() {
        let postVC = PostViewController()
        postVC.post = secondPost
        navigationController?.pushViewController(postVC, animated: true)
    }
}
