//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 30.05.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    var cellIndex = IndexPath()
    
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
        label.textColor = .systemGray
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        customizeCell()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likesTap))
        likesLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func likesTap(){
        print("Пользователь лайкнул пост на главном экране с номером = \(cellIndex.row)")
        ProfileViewController().addLike(row: cellIndex.row)
        
    }
    
    // функия для предотвращения багов
    override func prepareForReuse() {
        super.prepareForReuse()
        authorLabel.text = nil
        descriptionLabel.text = nil
        postImage.image = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    private func customizeCell(){
        contentView.backgroundColor = .white
        contentWhiteView.layer.borderWidth = 2
        contentWhiteView.layer.cornerRadius = 10
        contentWhiteView.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupCell(post: Post){
        postImage.image = UIImage(named: post.image)
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: " + String(post.likes)
        viewsLabel.text = "Views: " + String(post.views)
    }

    
    private func layout() {
        [contentWhiteView,authorLabel, postImage, descriptionLabel, likesLabel, viewsLabel].forEach {contentView.addSubview($0)}
        let viewInset: CGFloat = 8
        let imageInset: CGFloat = 10
        let heightView: CGFloat = 200
        let textInset:CGFloat = 16
        
        NSLayoutConstraint.activate([
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            
            authorLabel.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: textInset),
            authorLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            authorLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -textInset),
            
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: imageInset),
            postImage.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: imageInset),
            postImage.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -imageInset),
//            postImage.heightAnchor.constraint(equalToConstant: CGFloat(postImage.widthAnchor)),
            postImage.widthAnchor.constraint(equalToConstant: heightView - imageInset*2),
            postImage.heightAnchor.constraint(equalToConstant: heightView - imageInset*2),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: imageInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -textInset),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: textInset),
            likesLabel.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: textInset),
            likesLabel.trailingAnchor.constraint(equalTo: viewsLabel.leadingAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -textInset),
            
            viewsLabel.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor,constant: -textInset),
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -textInset),
            
            ])
    }
}
