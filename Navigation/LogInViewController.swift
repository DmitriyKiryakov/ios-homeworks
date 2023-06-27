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
        stackView.spacing = 1
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    
//    // разделитель двух полей
//    private lazy var middleView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemGray4
//        return view
//    }()
    
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
    
    private lazy var errorLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .red
        label.textAlignment = .center
        label.isHidden = true
        
        return label
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
        [userNameField, passwordField].forEach { textFieldStack.addArrangedSubview($0) }
//        textFieldStack.addArrangedSubview(userNameField)
//        textFieldStack.addArrangedSubview(middleView)
//        textFieldStack.addArrangedSubview(passwordField)
        contentView.addSubview(logButton)
        contentView.addSubview(errorLabel)
        
        
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
            
//            userNameField.topAnchor.constraint(equalTo: textFieldStack.topAnchor),
//            userNameField.heightAnchor.constraint(equalToConstant: 50),
//
//            middleView.heightAnchor.constraint(equalToConstant: 1),
//            middleView.topAnchor.constraint(equalTo: textFieldStack.topAnchor,constant: 50),
////
//            passwordField.topAnchor.constraint(equalTo: middleView.bottomAnchor),
//            passwordField.heightAnchor.constraint(equalToConstant: 50),

            logButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),

            errorLabel.topAnchor.constraint(equalTo: logButton.bottomAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: logButton.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: logButton.trailingAnchor),
            errorLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    @objc private func buttonPressed (){
//        errorLabel.isHidden = true
//        guard isTextFieldNoEmpty() else { return }
//        guard isValidEmail(userNameField.text!) else {
//            errorLabel.isHidden = false
//            shakeAnimation(textField: userNameField)
//            errorLabel.text = "В поле логин должен быть указан email"
//            return }
//        guard isPasswordLenghtEnough() else {return}
//        guard isLoginAndPasswordCorrect() else {return}
        //если все проверки прошли - запускаем следуюещий экран
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    //проверяем на на пустые поля
    private func isTextFieldNoEmpty() -> Bool{
        guard userNameField.text!.isEmpty == false else {
            shakeAnimation(textField: userNameField)
            return false
        }
        guard passwordField.text!.isEmpty == false else {
            shakeAnimation(textField: passwordField)
            return false
        }
        return true
    }
    
    // проверяем логин на валидность (email)
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // проверяем на длинну пароля
    private func isPasswordLenghtEnough() -> Bool {
        guard passwordField.text!.count >= 8 else {
            shakeAnimation(textField: passwordField)
            errorLabel.text = """
                    Длинна пароля должна быть
                    не менее 8 символов
                    """
            errorLabel.isHidden = false
            return false
        }
        return true
    }
    
    // проверяем логин и пароль
    private func isLoginAndPasswordCorrect() -> Bool {
        let user = "Dima@mail.ru"
        let password = "Qwerty123"
        
        guard userNameField.text == user else {
            showAlert(text: "Неверный логин")
            return false
        }
        guard passwordField.text == password else{
            showAlert(text: "Неверный пароль")
            passwordField.text = ""
            return false
        }
        return true
    }
    
    func showAlert (text: String) {
        let alert = UIAlertController(title: text, message: "", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Попробовать еще раз", style: .default, handler: { action in
        }))
        
        self.present(alert, animated: true)
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
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        errorLabel.isHidden = true
        guard isTextFieldNoEmpty() else { return false}
        guard isValidEmail(userNameField.text!) else {
            errorLabel.isHidden = false
            shakeAnimation(textField: userNameField)
            errorLabel.text = "В поле логин должен быть указан email"
            return false }
        guard isPasswordLenghtEnough() else {return false}
        guard isLoginAndPasswordCorrect() else {return false}
        view.endEditing(true)
        //если все проверки прошли - запускаем следуюещий экран
        navigationController?.pushViewController(ProfileViewController(), animated: true)
        return true
    }
}
