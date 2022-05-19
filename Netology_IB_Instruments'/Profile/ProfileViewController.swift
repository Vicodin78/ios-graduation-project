//
//  ProfileViewController.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 01.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var headerView = ProfileHeaderView()
    
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
    
//    private let backView: UIView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.backgroundColor = .black
//        $0.alpha = 0.0
//        return $0
//    }(UIView())
//    
//    private let exitFullScreenPost: UIImageView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.isUserInteractionEnabled = true
//        $0.image = UIImage(systemName: "multiply")
//        $0.contentMode = .scaleAspectFit
//        $0.alpha = 0.0
//        $0.tintColor = .systemGray2
//        return $0
//    }(UIImageView())
    
//    private func tapGesturesFullScreenPost() {
//        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        exitFullScreenPost.addGestureRecognizer(tapGest)
//    }
//
//    @objc private func tapAction() {
//        UIView.animate(withDuration: 0.4) {
////            cell.imageViewPost.removeFromSuperview()
//            self.backView.alpha = 0.0
//            self.exitFullScreenPost.alpha = 0.0
//            NSLayoutConstraint.deactivate(self.constraints)
//            NSLayoutConstraint.activate(self.exitConstraints)
////            cell.contentView.addSubview(cell.imageViewPost)
////            cell.contentView.addSubview(cell.descriptionLabel)
//
//            self.layout()
//            self.view.layoutIfNeeded()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
//        tapGesturesFullScreenPost()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func layout() {
//        headerView.backgroundColor = .systemGray6
        
//        [tableView, backView, exitFullScreenPost].forEach {view.addSubview($0)}
        [tableView].forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            backView.topAnchor.constraint(equalTo: view.topAnchor),
//            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
//    private var constraints = [NSLayoutConstraint]()
//    private var exitConstraints = [NSLayoutConstraint]()
//
//    private func presentForPost(cell: PostTableViewCell) {
//        let image = cell.imageViewPost
//        let description = cell.descriptionLabel
//
//        let insert: CGFloat = 16
//        let widthHeight: CGFloat = UIScreen.main.bounds.width
//
//        exitConstraints = [cell.imageViewPost.topAnchor.constraint(equalTo: cell.authorLabel.bottomAnchor, constant: insert),
//                           cell.imageViewPost.widthAnchor.constraint(equalToConstant: widthHeight),
//                           cell.imageViewPost.heightAnchor.constraint(equalToConstant: widthHeight),
//                           cell.imageViewPost.leadingAnchor.constraint(equalTo: cell.backGrView.leadingAnchor),
//                           cell.imageViewPost.trailingAnchor.constraint(equalTo: cell.backGrView.trailingAnchor),
//
//                           cell.descriptionLabel.topAnchor.constraint(equalTo: cell.imageViewPost.bottomAnchor, constant: insert),
//                           cell.descriptionLabel.leadingAnchor.constraint(equalTo: cell.backGrView.leadingAnchor, constant: insert),
//                           cell.descriptionLabel.trailingAnchor.constraint(equalTo: cell.backGrView.trailingAnchor, constant: -insert),]
//
//        UIView.animate(withDuration: 0.4) {
//            self.view.addSubview(cell.imageViewPost)
//            self.view.addSubview(description)
//            self.view.layoutIfNeeded()
//
//            self.backView.alpha = 0.85
////            description.numberOfLines = 10
//            description.textColor = .systemGray5
//            self.exitFullScreenPost.alpha = 1.0
//
//            self.constraints = [image.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (UIScreen.main.bounds.height - image.bounds.height)/4),
//
//            description.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
//            description.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
//            description.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),]
//
//            NSLayoutConstraint.activate(self.constraints)
//
//            NSLayoutConstraint.activate([
//                self.exitFullScreenPost.heightAnchor.constraint(equalToConstant: 40),
//                self.exitFullScreenPost.widthAnchor.constraint(equalToConstant: 40),
//                self.exitFullScreenPost.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//                self.exitFullScreenPost.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -10)
//            ])
//        }
//    }
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
//        presentForPost(cell: cell)
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
