//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 19.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var wall = Post.loadWall()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .white
        layout()
    }

    private func layout(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ProfileHeaderView()
    }
    
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wall.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //         Так вызываем кастомную ячейку:
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: wall[indexPath.row])
        return cell
    }
}
