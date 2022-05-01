//
//  ProfileViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 28.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let headerView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        view.addSubview(headerView)
    }
    
    override func viewWillLayoutSubviews() {
        headerView.frame = view.frame
    }
}
