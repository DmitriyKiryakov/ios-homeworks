//
//  PostDetailView.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 16.06.2023.
//

import UIKit

final class PostDetailView: UIViewController {
    
    var indexCell = IndexPath()
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        return label
    }()
    
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let descriptionLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let likesLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let viewsLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        customizeCell()
        gestureSetup()
    }
   
    
    private func gestureSetup(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likesTap))
        likesLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func likesTap(){
        print("Пользователь лайкнул пост с номером \(indexCell.row) на детальном экране с  ")
        ProfileViewController().addLike(row: indexCell.row)

    }
    
    private func customizeCell(){
        
        contentWhiteView.layer.borderWidth = 2
        contentWhiteView.layer.cornerRadius = 10
        contentWhiteView.layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    func setupVC(post: Post, index:IndexPath){
        postImage.image = UIImage(named: post.image)
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: " + String(post.likes)
        viewsLabel.text = "Views: " + String(post.views)
    }
    
   
    
    private func layout() {
        [contentWhiteView, postImage, descriptionLabel, likesLabel, viewsLabel].forEach {view.addSubview($0)}
        let viewInset: CGFloat = 8
        let imageInset: CGFloat = 10
        let heightView: CGFloat = 300
        let textInset:CGFloat = 16
        
        NSLayoutConstraint.activate([
            contentWhiteView.topAnchor.constraint(equalTo: view.topAnchor, constant: viewInset),
            contentWhiteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewInset),
            contentWhiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -viewInset),
            
            descriptionLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: textInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor,constant: -textInset),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 300),
            
            postImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: viewInset),
            postImage.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            postImage.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -40),
            
            likesLabel.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -textInset),
            likesLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            likesLabel.heightAnchor.constraint(equalToConstant: 50),
            likesLabel.widthAnchor.constraint(equalToConstant: 80),
            
            viewsLabel.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -textInset),
            viewsLabel.widthAnchor.constraint(equalTo: likesLabel.widthAnchor),
            viewsLabel.heightAnchor.constraint(equalTo: likesLabel.heightAnchor)
  
            ])
    }
}
