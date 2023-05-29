//
//  LogInViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 17.05.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    private let nc = NotificationCenter.default
    
    private let colorSet = UIColor(red: 0x48 / 255.0, green: 0x85 / 255.0, blue: 0xCC / 255.0, alpha: 1.0)
    
    private lazy var logoImage = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    private lazy var userNameField: TextFieldWithPadding = {
       let textField = TextFieldWithPadding()
        textField.placeholder = "Email or phone"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textAlignment = .left
        textField.tintColor = colorSet
        textField.delegate = self
        return textField
    }()
    
    private lazy var textFieldStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    
    // разделитель двух полей
    private lazy var middleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()
    
    
    private lazy var passwordField = {
       let textField = TextFieldWithPadding()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        textField.tintColor = colorSet
        textField.delegate = self
        return textField
    }()
    
    private lazy var logButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.isUserInteractionEnabled = true
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.layer.cornerRadius = 10
        let blue_pixel = UIImage(named: "blue_pixel")
        button.setBackgroundImage(blue_pixel, for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch button.state {
        case .normal      : button.alpha = 1
        case .selected    : button.alpha = 0.8
        case .highlighted : button.alpha = 0.8
        case .disabled    : button.alpha = 0.8
        default: button.alpha = 1
        }
        button.clipsToBounds = true
        return button
    }()
    
 
    
    
    private lazy var scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        nc.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: NSNotification){
        if let keyboard = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboard.height + logButton.frame.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboard.height  + logButton.frame.height, right: 0)
        }
    }
    @objc private func keyboardHide(){
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func layout(){
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImage)
        contentView.addSubview(textFieldStack)
        textFieldStack.addArrangedSubview(userNameField)
        textFieldStack.addArrangedSubview(middleView)
        textFieldStack.addArrangedSubview(passwordField)
        contentView.addSubview(logButton)
       
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            textFieldStack.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 120),
            textFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            textFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            userNameField.heightAnchor.constraint(equalToConstant: 50),
            
            middleView.heightAnchor.constraint(equalToConstant: 1),
            middleView.topAnchor.constraint(equalTo: userNameField.bottomAnchor),
            
            passwordField.topAnchor.constraint(equalTo: middleView.bottomAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            logButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            
            
        ])

        
    }
@objc private func buttonPressed (){
    navigationController?.pushViewController(ProfileViewController(), animated: true)

}
    
  

}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
