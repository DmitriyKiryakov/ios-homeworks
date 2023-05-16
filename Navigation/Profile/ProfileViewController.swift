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
        view.backgroundColor = UIColor.lightGray
        
        // Do any additional setup after loading the view.
        layout()
        
    }
    
    
    private func layout(){
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
       // profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        view.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    func setupConstraint() {
        //     let safeArea = view.safeAreaLayoutGuide.f
        
    }

}
