//
//  HomeViewController.swift
//  MoviesProject
//
//  Created by Тулепберген Анель  on 25.12.2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeFeedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y:0, width: view.bounds.width, height: 190))
        
    //    _ = UITableView(frame: .zero, style: .grouped)
        // Регистрация ячеек
        homeFeedTable.register(UITableViewCell.self, forCellReuseIdentifier: "CollectionViewTableViewCell") // Для стандартной ячейки
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds // Устанавливаем размер таблицы в пределах экрана
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Например, 5 строк
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTableViewCell", for: indexPath)
        cell.textLabel?.text = "Hello World \(indexPath.row)" // Пример текста для строки
        cell.backgroundColor = .green
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
