//
//  PhotosTableViewCell.swift
//  Netology_IB_Instruments'
//
//  Created by Vicodin on 07.05.2022.
//

import UIKit

protocol PhotosTabCellDelegate: AnyObject {
    func delegateFunc()
}

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTabCellDelegate?
    
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
        return $0
    }(UIImageView())
    
    private lazy var profileCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(CustomPhotosCollectionViewCell.self, forCellWithReuseIdentifier: CustomPhotosCollectionViewCell.identifier)
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        [backGrView, photosLabel, imgPhotosLab, profileCollectionView].forEach { contentView.addSubview($0)}
        
        let insert: CGFloat = 12
        
        let heightCoolection: CGFloat = (((UIScreen.main.bounds.width - insert) / 4) / 4 * 3) // соотношение сторон ячейки коллекции
        
        NSLayoutConstraint.activate([
        
            backGrView.heightAnchor.constraint(equalToConstant: contentView.bounds.height + heightCoolection + insert * 1.2), //insert - самый нижний отступ
            
            backGrView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backGrView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backGrView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backGrView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
            photosLabel.topAnchor.constraint(equalTo: backGrView.topAnchor, constant: insert),
            photosLabel.leadingAnchor.constraint(equalTo: backGrView.leadingAnchor, constant: insert),
            photosLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2 - insert),
            
            imgPhotosLab.trailingAnchor.constraint(equalTo: backGrView.trailingAnchor, constant: -insert),
            imgPhotosLab.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            imgPhotosLab.heightAnchor.constraint(equalTo: photosLabel.heightAnchor),
            imgPhotosLab.widthAnchor.constraint(equalTo: imgPhotosLab.heightAnchor),
            
            profileCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: insert),
            profileCollectionView.leadingAnchor.constraint(equalTo: backGrView.leadingAnchor, constant: insert),
            profileCollectionView.bottomAnchor.constraint(equalTo: backGrView.bottomAnchor, constant: -insert),
            profileCollectionView.trailingAnchor.constraint(equalTo: backGrView.trailingAnchor, constant: -insert),
        ])
    }
    
    private let photosModel: [UIImageView] = {
        var arrey = [UIImageView]()
        for i in 10...29 {
            arrey.append(UIImageView(image: UIImage(named: "img\(i)")))
        }
        return arrey
    }()

}

// MARK: - UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomPhotosCollectionViewCell.identifier, for: indexPath) as! CustomPhotosCollectionViewCell
        cell.setupCell(photosModel[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - (sideInset * 4)) / 4
        let height = (width / 4) * 3 // соотношение сторон ячейки коллекции
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.delegateFunc()
    }
}
