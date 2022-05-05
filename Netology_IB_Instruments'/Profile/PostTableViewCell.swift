//
//  PostTableViewCell.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 03.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
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
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.textAlignment = .justified
        return $0
    }(UILabel())
    
    private let imageViewPost: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private let likesLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private let viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: PostModel) {
        authorLabel.text = model.author
        descriptionLabel.text = model.description
        imageViewPost.image = UIImage(named: model.image)
        likesLabel.text = "Lkes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    private func layout() {
        [backGrView, authorLabel, descriptionLabel, imageViewPost, likesLabel, viewsLabel].forEach { contentView.addSubview($0)}
        
        let insert: CGFloat = 16
        let widthHeight: CGFloat = UIScreen.main.bounds.width
        
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
