//
//  ProfileViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var indexNumber = Int()
    
    private let headerView = ProfileHeaderView()
    
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
    
    private var postModel: [PostModel] = {
        let textPost = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        var post = [PostModel]()
        post.append(PostModel(author: "Ivan", description: textPost, image: "img1", likes: 0, views: 0))
        post.append(PostModel(author: "Nikolay", description: textPost, image: "img2", likes: 0, views: 0))
        post.append(PostModel(author: "Evgeniy", description: textPost, image: "img3", likes: 0, views: 0))
        post.append(PostModel(author: "Anastasia", description: textPost, image: "img4", likes: 0, views: 0))
        post.append(PostModel(author: "Olga", description: textPost, image: "img5", likes: 0, views: 0))
        return post
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func layout() {
        [tableView].forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
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
        if !postModel.isEmpty {
            cell.setupCell(postModel[indexPath.row])
        }
        cell.delegate = self
        cell.tag = indexPath.row
        
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
        if indexPath.section == 1 {
            let presentPostVC = PresentPostViewController()
            presentPostVC.imageViewPost.image = UIImage(named: postModel[indexPath.row].image)
            presentPostVC.descriptionLabel.text = postModel[indexPath.row].description
//            navigationController?.pushViewController(presentPostVC, animated: true)
            present(presentPostVC, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, boolValue) in
            self.postModel.remove(at: indexPath.row)
            UIView.animate(withDuration: 0.5) {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.reloadData()
            }
            boolValue(true)
            }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}

// MARK: - PhotosTabCellDelegate

extension ProfileViewController: PhotosTabCellDelegate {
    func delegateFunc() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}

// MARK: - CustomCellDelegate

extension ProfileViewController: CustomCellDelegate {
    func likeClicked(cell: PostTableViewCell) {
        if self.tableView.indexPath(for: cell) != nil {
            let like = cell.likesLabel.text
            var newStr = [String]()
            if let like = like {
                newStr = like.components(separatedBy: " ")
            }
            var number = NSString(string: newStr[1]).intValue
            number += 1
            cell.likesLabel.text = "Likes: \(number)"
            postModel[cell.tag].likes = Int(number) //Что бы при пролистывании ленты и выгрузки ячейки из памяти, счетчик не обнулялся.
        }
    }
    func viewsPresent(cell: PostTableViewCell) {
        tableView(tableView, didSelectRowAt: IndexPath(row: cell.tag, section: 1))
        if self.tableView.indexPath(for: cell) != nil {
            let view = cell.viewsLabel.text
            var newStr = [String]()
            if let view = view {
                newStr = view.components(separatedBy: " ")
            }
            var number = NSString(string: newStr[1]).intValue
            number += 1
            cell.viewsLabel.text = "Views: \(number)"
            postModel[cell.tag].views = Int(number)
        }
    }
}
