//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 19.04.2023.
//

import UIKit


class ProfileHeaderView: UIView {
     var statusText : String = ""
    
    private lazy var avatarImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        photo.layer.masksToBounds = false
        photo.layer.cornerRadius = 75
        photo.image = UIImage(named: "кот")
        photo.clipsToBounds = true
        return photo
        
    }()
  
    
    private lazy var setStatusButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.isUserInteractionEnabled = true
        button.setTitle("Show Status", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .blue
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        return button
        
    }()
    
    
    private lazy var  statusLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
        
    }()
    
    private lazy var fullNameLabel = {
    
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
        
    }()
    
    // другой вариант объявления оставлен тут в учебных целях чтобы не забыть что так тоже можно
    private lazy var statusTextField : TextFieldWithPadding = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textAlignment = .left
        $0.placeholder = "Enter status..."
        $0.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        
        
        return $0
    }(TextFieldWithPadding())
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        addUI()
        drawUI()
        
      
    }
    
    
    func addUI(){
        self.addSubview(avatarImageView)
        self.addSubview(setStatusButton)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
    }

    func drawUI(){

        NSLayoutConstraint.activate([
            //avatar
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            //setStatusButton
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            //fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //statusLabel
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor,constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10)
            
            
        ])
        
    }
    
    
    @objc func buttonPressed(){
        statusLabel.text = statusText
      
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        if let titleStatus = textField.text {
            statusText = titleStatus
        }
        
        
    }
    
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
