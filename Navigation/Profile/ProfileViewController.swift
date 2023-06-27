//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Дмитрий Кирьяков on 19.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var wall = Post.loadWall()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // регистрируем ячейки посты
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        // регистрируем ячейку с фото
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
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
        print("Count of wall now =\(self.wall.count)")

        print("Count of wall now =\(self.wall.count)")
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
    
    public func addLike(row: Int){
        print("Элементов в массиве  - \(wall.count)")
        wall[row].likes += 1
        print("Ячейке с номером \(row) поставили лайк и теперь там \(wall[row].likes) лайков")
        tableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // мы показываем наш кастомный футер с котом только для первой секции
        if section == 0 {
            return ProfileHeaderView()
         
        } else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else {
            let detailVC = PostDetailView()
            print("indexPath.section = \(indexPath.section) IndexPath.row =\(indexPath.row)")
            wall[indexPath.row].views += 1
            tableView.reloadData()
            detailVC.indexCell = indexPath
            detailVC.setupVC(post: wall[indexPath.row], index: indexPath)
            present(detailVC, animated: true)
//            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return 1
        } else {
           return wall.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //         Так вызываем кастомную ячейку:
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(post: wall[indexPath.row])
            cell.cellIndex = indexPath
            return cell
        }
    }
}
