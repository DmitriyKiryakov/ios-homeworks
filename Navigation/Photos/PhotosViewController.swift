//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 07.06.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private let myImages = Images.arrayOfImagesNames()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            CustomCollectionViewCell2.self, forCellWithReuseIdentifier: CustomCollectionViewCell2.identifier)
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        layout()
        
        title = "Photo Gallery"
    }

        
    private func layout(){
        view.addSubview(collectionView)
   
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
    

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    var intInset: CGFloat {return 8}
     var extInset: CGFloat {return 12}
    
 
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (intInset * 2 + extInset*2)) / 3
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

extension PhotosViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myImages.count
   }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell2.identifier, for: indexPath) as! CustomCollectionViewCell2
       cell.setupCell(img: myImages[indexPath.row])
       return cell
   }
   
   
}
