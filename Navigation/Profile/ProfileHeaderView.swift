//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 19.04.2023.
//

import UIKit


class ProfileHeaderView: UIView {
    var userPhoto: UIImageView!
    var mainLabel: UILabel!
    var statusLabel: UILabel!
    var changeStatusButton: UIButton!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        setupUserPhoto()
        setupMainLabel()
        setupStatusLabel()
        setupChangeStatusButton()
        
                
        
        
    }
    
//    override func viewDidLayoutSubviews(){
//        super.viewDidLayoutSubviews()
//
        
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let xInset1: Int = 16
        let yInset2: Int = 16
        let yInset3 = 27
        let yInset4 = 34
        
        changeStatusButton.frame = CGRect(x: 16, y: Int(userPhoto.frame.height) + 2*16, width: Int((superview?.frame.width ?? 100)-2*16), height: 50)
        mainLabel.frame = CGRect(x: Int((superview?.frame.width ?? 0))/2 , y: yInset3, width: 300, height: 50)
        statusLabel.frame = CGRect(x: mainLabel.frame.origin.x, y: changeStatusButton.frame.origin.y - 34-50, width: 300, height: 50)
        //changeStatusButton.frame = CGRect(x: 16, y: Int(userPhoto.frame.height) + 2*yInset2, width: Int((superview?.frame.width ?? 100)-2*xInset1), height: 50)
        // почему это строчка выдает ошибку??
        //The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    }
    
    
    private func setupChangeStatusButton(){
        changeStatusButton = UIButton(frame: CGRect(x: 16, y: 250, width: 320, height: 50))
        changeStatusButton.layer.cornerRadius = 16
        changeStatusButton.isUserInteractionEnabled = true
        changeStatusButton.setTitle("Show Status", for: .normal)
        changeStatusButton.titleLabel?.textColor = .white
        changeStatusButton.backgroundColor = .blue
        
        changeStatusButton.layer.shadowOffset.width = 4
        changeStatusButton.layer.shadowOffset.height = 4
        changeStatusButton.layer.shadowRadius = 4
        changeStatusButton.layer.shadowColor = UIColor.black.cgColor
        changeStatusButton.layer.shadowOpacity = 0.7
        
        changeStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
        
        self.addSubview(changeStatusButton)
        
        
        
    }
    
    @objc func buttonPressed(){
        print(statusLabel.text)
    }
    
    
    private func setupStatusLabel(){
        statusLabel = UILabel(frame: CGRect(x: 150, y: 150, width: 300, height: 50))
        statusLabel.text = "Waiting for something"
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(statusLabel)
    }
    
    
    private func setupMainLabel() {
        mainLabel = UILabel(frame: CGRect(x: 150, y: 27, width: 300, height: 50))

        
      //  mainLabel.backgroundColor = .systemGray
        mainLabel.text = "Hipster Cat"
        mainLabel.textColor = .black
        mainLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        self.addSubview(mainLabel)
        
    }
    
    //Настраиваем фото
    private func setupUserPhoto(){
        
        userPhoto = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        userPhoto.layer.borderWidth = 3
        userPhoto.layer.borderColor = UIColor.white.cgColor
        userPhoto.layer.masksToBounds = false
        userPhoto.layer.cornerRadius = userPhoto.frame.height/2
        userPhoto.image = UIImage(named: "кот")
        userPhoto.clipsToBounds = true
        
        self.addSubview(userPhoto)
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
