//
//  ProfileViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var headerView = ProfileHeaderView()
    private lazy var avatar = headerView.avatarImageView
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        return tableView
    }()
    
    private let postModel = PostModel.makePost()
    
    private let viewForPresent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.alpha = 0.0
        return $0
    }(UIView())
    
    private let profileExitFullScreen: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "multiply")
        $0.contentMode = .scaleAspectFit
        $0.alpha = 0.0
        $0.tintColor = .systemGray6
        return $0
    }(UIImageView())
    
    private func tapGesturesExit() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapActionExit))
        profileExitFullScreen.addGestureRecognizer(tapGest)
        profileExitFullScreen.isUserInteractionEnabled = true
    }

    @objc private func tapActionExit() {
        UIView.animate(withDuration: 0.3) {
            self.profileExitFullScreen.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.viewForPresent.alpha = 0.0
                
                self.headerView.avatarImageView.layer.cornerRadius = 50
                self.headerView.avatarImageView.layer.borderWidth = 3
                self.headerView.avatarImageView.contentMode = .scaleAspectFill
                self.headerView.avatarImageView.clipsToBounds = true
                
                self.headerView.layout()
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesturesExit()
        view.backgroundColor = .systemGray6
        headerView.delegate = self
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func layout() {
        headerView.backgroundColor = .systemGray6
        
        [tableView, viewForPresent].forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            viewForPresent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForPresent.topAnchor.constraint(equalTo: view.topAnchor),
            viewForPresent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForPresent.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : postModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let firstCell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
        firstCell.delegate = self
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(postModel[indexPath.row])
        
        return indexPath.section == 0 ? firstCell : cell
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        section == 0 ? headerView : UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        }
    }
}

extension ProfileViewController: PhotosTabCellDelegate {
    func delegateFunc() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}

extension ProfileViewController: ProfileHeaderViewDelegate {
    func profileDelegateFunc() {
        self.avatar.layer.borderWidth = 0
        UIView.animate(withDuration: 0.5) {
            self.viewForPresent.alpha = 0.7
            self.avatar.layer.cornerRadius = 0
            self.avatar.translatesAutoresizingMaskIntoConstraints = false
            self.avatar.contentMode = .scaleAspectFit
            self.avatar.clipsToBounds = false
            self.view.addSubview(self.avatar)
            self.view.addSubview(self.profileExitFullScreen)
            
            NSLayoutConstraint.activate([
                self.avatar.topAnchor.constraint(equalTo: self.viewForPresent.topAnchor),
                self.avatar.leadingAnchor.constraint(equalTo: self.viewForPresent.leadingAnchor),
                self.avatar.bottomAnchor.constraint(equalTo: self.viewForPresent.bottomAnchor),
                self.avatar.trailingAnchor.constraint(equalTo: self.viewForPresent.trailingAnchor),
                
                self.profileExitFullScreen.heightAnchor.constraint(equalToConstant: 40),
                self.profileExitFullScreen.widthAnchor.constraint(equalToConstant: 40),
                self.profileExitFullScreen.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                self.profileExitFullScreen.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ])
            
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.profileExitFullScreen.alpha = 1.0
            }
        }
    }
}
