//
//  ProfileViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 29.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let headerView = ProfileHeaderView()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemGray5
            headerView.custom()
            view.addSubview(headerView)
            view.addSubview(headerView.secondTitle)
        }
        
        override func viewWillLayoutSubviews() {
            headerView.frame = view.frame
        }
    }
}
