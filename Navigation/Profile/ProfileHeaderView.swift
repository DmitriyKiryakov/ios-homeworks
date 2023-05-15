//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 19.04.2023.
//

import UIKit


class ProfileHeaderView: UIView {
   
    
    private lazy var userPhoto = {
        let photo = UIImageView()
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        photo.layer.masksToBounds = false
        photo.layer.cornerRadius = 75
        photo.image = UIImage(named: "кот")
        photo.clipsToBounds = true
        return photo
        
    }()
  
    
    private lazy var changeStatusButton = {
        let button = UIButton()
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
        label.text = "Waiting for something"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
        
    }()
    
    private lazy var mainLabel = {
    
        let label = UILabel()
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
        
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        addUI()
       // drawUI()
      
    }
    
    
    func addUI(){
        self.addSubview(userPhoto)
        self.addSubview(changeStatusButton)
        self.addSubview(mainLabel)
        self.addSubview(statusLabel)
    }

    func drawUI(){
        let xInset1: Int = 16
        let yInset2: Int = 16
        let yInset3 = 27
        let yInset4 = 34
        
        userPhoto.frame = CGRect(x: xInset1, y: xInset1, width: 150, height: 150)
        changeStatusButton.frame = CGRect(x: xInset1, y: Int(userPhoto.frame.height) + 2*16, width: Int((superview?.frame.width ?? 100)-2*16), height: 50)
        // @Михаил @Алексей почему когда я вместо чисел подставляю константы компилятор пишет ошибку?
        //The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
        // changeStatusButton.frame = CGRect(x: xInset1, y: Int(userPhoto.frame.height) + 2*xInset1, width: Int((superview?.frame.width ?? 100)-2*xInset1), height: 50)
        mainLabel.frame = CGRect(x: Int((superview?.frame.width ?? 0))/2 , y: yInset3, width: 300, height: 50)
        statusLabel.frame = CGRect(x: mainLabel.frame.origin.x, y: changeStatusButton.frame.origin.y - 34-50, width: 300, height: 50)
        
    }
    
    
    @objc func buttonPressed(){
        print(statusLabel.text ?? "")
    }
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawUI()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
