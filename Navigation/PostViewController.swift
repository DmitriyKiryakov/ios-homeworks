//
//  PostViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 17.04.2023.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        
//На PostViewController добавьте Bar Button Item в навигейшн бар. При нажатии на него должен открываться новый контроллер InfoViewController. Контроллер должен показаться модально.


        
        let myBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = myBarButton
        
        

        // Do any additional setup after loading the view.
    }
    
    // показываем контроллер модально
    @objc func showInfo(){
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
    
    
    
    // дополнительная фунция которая получает структуру пост и ставит заголовок в качестве title контроллера
    func changeTitle(post: Post) {
        
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
