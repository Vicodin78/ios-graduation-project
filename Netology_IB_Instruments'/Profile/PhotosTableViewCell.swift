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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [backGrView, photosLabel, imgPhotosLab].forEach { contentView.addSubview($0)}
        
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
            imgPhotosLab.heightAnchor.constraint(equalTo: photosLabel.heightAnchor)
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
