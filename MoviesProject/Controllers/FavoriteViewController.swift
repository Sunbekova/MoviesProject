import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var FavouriteMoviesTableView: UITableView!

    var favoriteMovies = [Title]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем фон таблицы в цвет #290800
        FavouriteMoviesTableView.backgroundColor = UIColor(red: 41/255.0, green: 8/255.0, blue: 0/255.0, alpha: 1.0)
        
        FavouriteMoviesTableView.dataSource = self
        FavouriteMoviesTableView.register(FavouriteMoviesTableViewCell.nib(), forCellReuseIdentifier: FavouriteMoviesTableViewCell.identifier)
        
        // Изначально данные могут быть загружены в viewDidLoad, но обновление таблицы следует делать в viewWillAppear
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadFavoriteMovies() // Загружаем избранные фильмы каждый раз перед показом экрана
        FavouriteMoviesTableView.reloadData() // Обновляем таблицу, чтобы отобразить новые данные
    }

    func loadFavoriteMovies() {
        if let savedMovies = UserDefaults.standard.data(forKey: "FavoriteMovies") {
            let decoder = JSONDecoder()
            do {
                let loadedMovies = try decoder.decode([Title].self, from: savedMovies)
                favoriteMovies = loadedMovies
                print("Избранные фильмы загружены: \(favoriteMovies)")
            } catch {
                print("Ошибка при загрузке фильмов: \(error.localizedDescription)")
            }
        } else {
            print("Нет сохраненных избранных фильмов.")
        }
    }

    func saveFavoriteMovies() {
        let encoder = JSONEncoder()
        do {
            let encodedMovies = try encoder.encode(favoriteMovies)
            UserDefaults.standard.set(encodedMovies, forKey: "FavoriteMovies")
        } catch {
            print("Ошибка при сохранении фильмов: \(error.localizedDescription)")
        }
    }

    @IBAction func clearAllFavoriteMovies(_ sender: UIBarButtonItem) {
        // Очистить список избранных фильмов
        favoriteMovies.removeAll()
        
        // Сохранить изменения в UserDefaults
        saveFavoriteMovies()
        
        // Обновить таблицу
        FavouriteMoviesTableView.reloadData()
        
        // Вывести сообщение, что список пуст
        print("Все избранные фильмы удалены.")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteMoviesTableViewCell.identifier, for: indexPath) as? FavouriteMoviesTableViewCell else {
            return UITableViewCell()
        }

        let movie = favoriteMovies[indexPath.row]
        cell.configure(with: movie)

        return cell
    }
    // Удаление фильма из избранного с помощью swipe-to-delete
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Удаляем фильм из массива
                favoriteMovies.remove(at: indexPath.row)
                
                // Сохраняем изменения
                saveFavoriteMovies()
                
                // Удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}
