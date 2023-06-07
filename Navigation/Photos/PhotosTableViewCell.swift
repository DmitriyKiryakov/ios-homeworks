//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 07.06.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    let inset: CGFloat = 12
    let myImages = Images.arrayOfImagesNames()
    
    private let contentYellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collectionContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iArrow: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "arrow.right")
        image.contentMode = .scaleAspectFill
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let photosLabel: UILabel = {
       let label = UILabel()
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        contentView.addSubview(contentYellowView)
        contentView.addSubview(photosLabel)
        contentView.addSubview(iArrow)
        
        contentView.addSubview(collectionContentView)
        collectionContentView.addSubview(horizontalCollectionView)
        
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 150),
            
            contentYellowView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentYellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentYellowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentYellowView.heightAnchor.constraint(equalToConstant: 50),
            
            collectionContentView.topAnchor.constraint(equalTo: contentYellowView.bottomAnchor),
            collectionContentView.leadingAnchor.constraint(equalTo: contentYellowView.leadingAnchor),
            collectionContentView.trailingAnchor.constraint(equalTo: contentYellowView.trailingAnchor),
            collectionContentView.heightAnchor.constraint(equalToConstant: 100),
            
            photosLabel.topAnchor.constraint(equalTo: contentYellowView.topAnchor, constant: inset),
            photosLabel.leadingAnchor.constraint(equalTo: contentYellowView.leadingAnchor, constant: inset),
            
            iArrow.topAnchor.constraint(equalTo: photosLabel.topAnchor),
            iArrow.trailingAnchor.constraint(equalTo: contentYellowView.trailingAnchor, constant: -inset),
            
            horizontalCollectionView.topAnchor.constraint(equalTo: collectionContentView.topAnchor),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: collectionContentView.leadingAnchor),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: collectionContentView.trailingAnchor),
            horizontalCollectionView.bottomAnchor.constraint(equalTo: collectionContentView.bottomAnchor),
            
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    var intInset: CGFloat {return 8}
     var extInset: CGFloat {return 12}
    
 
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (intInset * 3 + extInset*2)) / 4
        return CGSize(width: width, height: width)
   }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        intInset
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: intInset, left: intInset, bottom: intInset, right: intInset)
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        intInset
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.setupCell(img: myImages[indexPath.row])
        return cell
    }
    
    
}
