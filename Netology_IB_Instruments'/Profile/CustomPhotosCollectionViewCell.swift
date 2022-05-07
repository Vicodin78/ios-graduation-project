//
//  CustomPhotosCollectionViewCell.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 07.05.2022.
//

import UIKit

class CustomPhotosCollectionViewCell: UICollectionViewCell {
    
    private let image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.contentMode = .scaleToFill
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ model: UIImageView) {
        image.image = model.image
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 10
        
    }
    
    private func layout() {
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
     
}
