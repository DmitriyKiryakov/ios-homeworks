//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 19.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = UIColor.lightGray        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        view.addSubview(profileHeaderView)
    }
    
    func setupConstraint() {
        //     let safeArea = view.safeAreaLayoutGuide.f
        
    }

}
