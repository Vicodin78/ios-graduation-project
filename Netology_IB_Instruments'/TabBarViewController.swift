//
//  TabBarViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 24.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let feedViewController = FeedViewController()
    let profileViewController = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        let firstVC = UINavigationController(rootViewController: feedViewController)
        let secondVC = UINavigationController(rootViewController: profileViewController)
        
        feedViewController.tabBarItem.title = "Лента"
        feedViewController.navigationItem.title = "FeedView"
        feedViewController.tabBarItem.image = UIImage(systemName: "newspaper")
        
        profileViewController.tabBarItem.title = "Профиль"
        profileViewController.navigationItem.title = "ProfileView"
        profileViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        
        viewControllers = [firstVC, secondVC]
    }
}
