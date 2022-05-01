//
//  ProfileViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 29.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let headerView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        customHeaderView()
    }
    
    private func customHeaderView() {
        view.backgroundColor = .systemGray6
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .lightGray
        
        [headerView].forEach {view.addSubview($0)}

        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250)//в 220 не влезло
        ])
    }
}
