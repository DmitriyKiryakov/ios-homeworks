//
//  InfoViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 17.04.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let postButton = UIButton(type: .system)
        postButton.isUserInteractionEnabled = true
        postButton.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 150, height: 30))
        postButton.setTitle("Alert", for: .normal)
        postButton.tintColor = .red
        postButton.backgroundColor = .gray
        view.addSubview(postButton)
        postButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
    }
    
    @objc func showAlert () {
        let alert = UIAlertController(title: "Я верно выполнил дз?", message: "Лучше скажите да", preferredStyle: .alert)
         
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            print("Вы нажали Да")
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .destructive, handler: { action in
            print("Вы нажали Нет")
        }))
        
       
       
         
        self.present(alert, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
