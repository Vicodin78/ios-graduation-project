//
//  PhotosTableViewCell.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 07.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let backGrView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    private let photosLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
        $0.text = "Photos"
        return $0
    }(UILabel())
    
    private let imgPhotosLab: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "arrow.right")
        $0.tintColor = .black
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let photoForStack1: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "img10")
//        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let photoForStack2: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "img11")
//        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let photoForStack3: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "img12")
//        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let photoForStack4: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "img13")
//        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let stackPhotos: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        return $0
    }(UIStackView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [backGrView, photosLabel, imgPhotosLab, stackPhotos].forEach { contentView.addSubview($0)}
        
        [photoForStack1, photoForStack2, photoForStack3, photoForStack4].forEach { stackPhotos.addArrangedSubview($0)}
        
        let insert: CGFloat = 12
        
        NSLayoutConstraint.activate([
            backGrView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backGrView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backGrView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backGrView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            photosLabel.topAnchor.constraint(equalTo: backGrView.topAnchor, constant: insert),
            photosLabel.leadingAnchor.constraint(equalTo: backGrView.leadingAnchor, constant: insert),
            photosLabel.bottomAnchor.constraint(equalTo: backGrView.bottomAnchor),
            photosLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2 - insert),

            imgPhotosLab.trailingAnchor.constraint(equalTo: backGrView.trailingAnchor, constant: -insert),
            imgPhotosLab.widthAnchor.constraint(equalTo: imgPhotosLab.heightAnchor),
            imgPhotosLab.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            imgPhotosLab.heightAnchor.constraint(equalTo: photosLabel.heightAnchor),
            
            stackPhotos.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            stackPhotos.leadingAnchor.constraint(equalTo: backGrView.leadingAnchor),
            stackPhotos.bottomAnchor
            
        ])
        
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
