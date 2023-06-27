//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 19.04.2023.
//

import UIKit


class ProfileHeaderView: UIView {
    var statusText : String = ""
    private var avatarTop = NSLayoutConstraint()
    private var avatarHeight = NSLayoutConstraint()
    private var avatarLead = NSLayoutConstraint()
    private var avatarWidth = NSLayoutConstraint()
    private var avatarTrail = NSLayoutConstraint()
    private var transparentHeight = NSLayoutConstraint()
    
    private lazy var avatarImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.borderWidth = 3
        photo.layer.borderColor = UIColor.white.cgColor
        photo.contentMode = .scaleToFill
        photo.layer.masksToBounds = false
        photo.layer.cornerRadius = 75
        photo.image = UIImage(named: "кот")
        photo.clipsToBounds = true
        photo.isUserInteractionEnabled = true
        photo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar)))
        return photo
    }()
    
    private lazy var avatarImagePlace = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private lazy var avatarCloseButton = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "xmark.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCloseGesture)))
        return imageView
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
    
    private lazy var transparentField = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.9)
        view.isHidden = true
        view.alpha = 1
        view.image = UIImage(named: "fabric")
                             
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addUI()
        drawUI()
    }
    
    func addUI(){
       
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(transparentField)
        addSubview(avatarImagePlace)
        addSubview(avatarImageView)
        addSubview(avatarCloseButton)
        
    }

    func drawUI(){
        //avatar
        avatarTop = avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        avatarLead =  avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16)
        avatarHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        avatarWidth = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([avatarTop, avatarLead, avatarHeight,avatarWidth])
        
        transparentHeight = transparentField.heightAnchor.constraint(equalToConstant: 0)
        
        
        NSLayoutConstraint.activate([
            transparentHeight,
            //setStatusButton
            avatarImagePlace.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImagePlace.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            avatarImagePlace.heightAnchor.constraint(equalToConstant: 150),
            avatarImagePlace.widthAnchor.constraint(equalToConstant: 150),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImagePlace.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: avatarImagePlace.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            //fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImagePlace.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //statusLabel
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor,constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImagePlace.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            
            transparentField.topAnchor.constraint(equalTo: topAnchor),
            transparentField.leadingAnchor.constraint(equalTo: leadingAnchor),
            transparentField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            avatarCloseButton.widthAnchor.constraint(equalToConstant: 30),
            avatarCloseButton.heightAnchor.constraint(equalToConstant: 30),
            avatarCloseButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            avatarCloseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        ])
        print(UIScreen.main.bounds.height)
    }
    
    @objc func buttonPressed(){
        guard isTextFieldNoEmpty() else { return }
        statusLabel.text = statusText
        
    }
    
    private func isTextFieldNoEmpty() -> Bool{
      
        guard statusTextField.text!.isEmpty == false else {
            shakeAnimation(textField: statusTextField)
            return false
        }
        return true
    }
    
    private func shakeAnimation(textField: UITextField){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }

    
    @objc func tapOnAvatar(){
        
        print("Avatar taped")
        UIView.animateKeyframes(withDuration: 0.8, delay: 0.0) {
        
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.625){
                self.transparentHeight.constant = UIScreen.main.bounds.height - 100
                self.transparentField.isHidden = false
                self.transparentField.alpha = 1
                self.avatarTop.constant = 30
                self.avatarLead.constant = 30
//                self.avatarTrail.constant = 30
                self.avatarWidth.constant = self.transparentField.frame.width - 60
                self.avatarHeight.constant = UIScreen.main.bounds.height - 220
                self.avatarImageView.layer.cornerRadius = 0
                self.avatarCloseButton.isHidden = false
            }
            UIView.addKeyframe(withRelativeStartTime: 0.625, relativeDuration: 1.0-0.625){
                self.avatarCloseButton.layer.opacity = 1
                
            }
        }
    }
    
    @objc func tapCloseGesture(){
        UIView.animateKeyframes(withDuration: 0.8, delay: 0){
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0 - 0.626){
                self.avatarCloseButton.layer.opacity = 0
                self.transparentField.layer.opacity = 0
                self.avatarCloseButton.isHidden = true
                self.transparentHeight.constant = 0
                self.transparentField.isHidden = true
            }
            UIView.addKeyframe(withRelativeStartTime: 1.0 - 6.25, relativeDuration: 6.25){
                self.avatarTop.constant = 16
                self.avatarLead.constant = 16
                self.avatarHeight.constant = 150
                self.avatarWidth.constant = 150
                self.avatarImageView.layer.cornerRadius = 75
            }
        }
        
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
