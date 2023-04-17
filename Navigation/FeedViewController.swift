//
//  FeedViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 17.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Новость дня", text: "Текст новости")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Лента"
        view.backgroundColor = .systemGray
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let postButton = UIButton(type: .system)
        postButton.isUserInteractionEnabled = true
        postButton.frame = CGRect(origin: CGPoint(x: 30, y: 120), size: CGSize(width: 150, height: 30))
        postButton.setTitle("Показать пост", for: .normal)
        postButton.backgroundColor = .darkGray
        view.addSubview(postButton)
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
    }
    
    @objc func showPost () {
        let postViewController = PostViewController()
        
        navigationController?.pushViewController(postViewController, animated: true)
        // Передаем Title в заголовок
        postViewController.changeTitle(post: post)
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
