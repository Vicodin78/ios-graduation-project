//
//  TabBarViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 24.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let feedViewController = FeedViewController()
    private let logInViewController = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        let firstVC = UINavigationController(rootViewController: feedViewController)
        let secondVC = UINavigationController(rootViewController: logInViewController)
        
        feedViewController.tabBarItem.title = "Лента"
        feedViewController.navigationItem.title = "FeedView"
        feedViewController.tabBarItem.image = UIImage(systemName: "newspaper")
        
        logInViewController.tabBarItem.title = "Профиль"
        logInViewController.navigationItem.title = "ProfileView"
        logInViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        
        viewControllers = [firstVC, secondVC]
    }
}
