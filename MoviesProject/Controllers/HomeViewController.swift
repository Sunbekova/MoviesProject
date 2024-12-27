import UIKit

class HomeViewController: UIViewController {
    
    private var movieList: [Title] = [] // Используем Title вместо Movie

    @IBOutlet weak var TrandingMoviesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка UITableView
        TrandingMoviesTable.dataSource = self
        TrandingMoviesTable.delegate = self
        TrandingMoviesTable.register(TrandingMoviesTableViewCell.nib(), forCellReuseIdentifier: TrandingMoviesTableViewCell.identifier)
        
        // Загрузка данных о фильмах
        fetchTrendingMovies()
    }
    
    private func fetchTrendingMovies() {
        APICaller.shared.getTrendingMovies { [weak self] result in
            switch result {
            case .success(let titles): // Изменили с movies на titles
                self?.movieList = titles // Загружаем список Title
                DispatchQueue.main.async {
                    self?.TrandingMoviesTable.reloadData() // Обновляем таблицу
                }
            case .failure(let error):
                print("Failed to fetch movies: \(error.localizedDescription)")
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count // movieList теперь содержит Title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrandingMoviesTableViewCell.identifier, for: indexPath) as! TrandingMoviesTableViewCell
        
        let currentTitle = movieList[indexPath.row] // Получаем текущий Title
        cell.configure(with: currentTitle) // Убедитесь, что configure метод принимает Title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController else { return }

        vc.selectedMovie = movieList[indexPath.row] // Передаем выбранный Title
        navigationController?.pushViewController(vc, animated: true)
    }
}
