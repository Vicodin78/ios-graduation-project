//
//  PostTableViewCell.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 03.05.2022.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func likeClicked(cell: PostTableViewCell)
    func viewsPresent(cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
    
    weak var delegate: CustomCellDelegate?
    
    private let backGrView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    private let authorLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    private let descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 3
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.textAlignment = .justified
        return $0
    }(UILabel())
    
    private let imageViewPost: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    let likesLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        $0.isUserInteractionEnabled = true
        return $0
    }(UILabel())
    
    let viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        tapActionForLikes()
        tapActionForViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tapActionForLikes() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        likesLabel.addGestureRecognizer(tapGest)
    }
    
    @objc private func tapAction() {
        delegate?.likeClicked(cell: self)
    }
    
    private func tapActionForViews() {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tapActionViews))
        imageViewPost.addGestureRecognizer(tapGest)
    }
    
    @objc private func tapActionViews() {
        delegate?.viewsPresent(cell: self)
    }
    
    func setupCell(_ model: PostModel) {
        authorLabel.text = model.author
        descriptionLabel.text = model.description
        imageViewPost.image = UIImage(named: model.image)
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    private func layout() {
        
        let insert: CGFloat = 16
        let widthHeight: CGFloat = UIScreen.main.bounds.width
        
        [backGrView, authorLabel,  likesLabel, viewsLabel, imageViewPost, descriptionLabel].forEach { contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            backGrView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backGrView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backGrView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backGrView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            authorLabel.topAnchor.constraint(equalTo: backGrView.topAnchor, constant: insert),
            authorLabel.leadingAnchor.constraint(equalTo: backGrView.leadingAnchor, constant: insert),
            authorLabel.trailingAnchor.constraint(equalTo: backGrView.trailingAnchor, constant: -insert),

            imageViewPost.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: insert),
            imageViewPost.widthAnchor.constraint(equalToConstant: widthHeight),
            imageViewPost.heightAnchor.constraint(equalToConstant: widthHeight),
            imageViewPost.leadingAnchor.constraint(equalTo: backGrView.leadingAnchor),
            imageViewPost.trailingAnchor.constraint(equalTo: backGrView.trailingAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: imageViewPost.bottomAnchor, constant: insert),
            descriptionLabel.leadingAnchor.constraint(equalTo: backGrView.leadingAnchor, constant: insert),
            descriptionLabel.trailingAnchor.constraint(equalTo: backGrView.trailingAnchor, constant: -insert),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: insert),
            likesLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: backGrView.bottomAnchor, constant: -insert),
            likesLabel.widthAnchor.constraint(equalToConstant: (widthHeight / 2) - insert),

            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: backGrView.trailingAnchor, constant: -insert)
        ])
    }
}
