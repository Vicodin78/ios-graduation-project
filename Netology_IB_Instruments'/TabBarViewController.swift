//
//  TabBarViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 24.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let feedViewController = FeedViewController()
    let logInViewController = LogInViewController()
//    let profileViewController = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        let firstVC = UINavigationController(rootViewController: feedViewController)
        let secondVC = UINavigationController(rootViewController: logInViewController)
//        let secondVC = UINavigationController(rootViewController: profileViewController)
        
        feedViewController.tabBarItem.title = "Лента"
        feedViewController.navigationItem.title = "FeedView"
        feedViewController.tabBarItem.image = UIImage(systemName: "newspaper")
        
        logInViewController.tabBarItem.title = "Профиль"
        logInViewController.navigationItem.title = "ProfileView"
        logInViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        secondVC.navigationBar.isHidden = true
        
        viewControllers = [firstVC, secondVC]
    }
}
