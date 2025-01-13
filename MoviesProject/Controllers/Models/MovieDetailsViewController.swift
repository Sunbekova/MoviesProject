import UIKit
import Kingfisher
import WebKit

protocol MovieDetailsViewControllerDelegate: AnyObject {
    func didAddMovieToFavorites(_ movie: Title)
}

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var trailerWebView: WKWebView!
    
    var favoriteMovies = [Title]()
    weak var delegate: MovieDetailsViewControllerDelegate?
    var selectedMovie: Title?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchTrailer()
    }

    private func configureUI() {
        guard let movie = selectedMovie else { return }

        // Set movie details
        titleLabel.text = movie.original_title ?? "Unknown Title"
        releaseDateLabel.text = "\(movie.release_date ?? "Unknown")"
        overviewLabel.text = movie.overview ?? "No Overview Available"
        ratingLabel.text = "\(String(format: "%.1f", movie.vote_average))"

        // Set poster image
        if let posterPath = movie.poster_path {
            let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            posterImageView.kf.setImage(with: posterURL)
        } else {
            posterImageView.image = UIImage(systemName: "photo.artframe") // Placeholder
        }

        // Hide trailer initially
        trailerWebView.isHidden = true
    }

    @IBAction func addToFavoritesButtonTapped(_ sender: UIButton) {
        guard let movie = selectedMovie else { return }

        // Проверка, не был ли фильм уже добавлен в избранное
        var allFavoriteMovies = loadFavoriteMovies()
        if allFavoriteMovies.contains(where: { $0.id == movie.id }) {
            print("Фильм уже в избранных!")
            return
        }

        addMovieToFavorites(movie)

        let alert = UIAlertController(title: "Добавлено в избранное", message: "Фильм добавлен в избранные!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)

        loadFavoriteMovies() // Обновляем список избранных фильмов после добавления
    }

    func addMovieToFavorites(_ movie: Title) {
        delegate?.didAddMovieToFavorites(movie)

        // Сохраняем избранные фильмы в UserDefaults
        var allFavoriteMovies = loadFavoriteMovies()
        allFavoriteMovies.append(movie)

        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(allFavoriteMovies)
            UserDefaults.standard.set(encoded, forKey: "FavoriteMovies")
            print("Фильм добавлен в избранное") // Логируем успешное добавление
        } catch {
            print("Ошибка при кодировании фильма: \(error.localizedDescription)")
        }
    }

    private func loadFavoriteMovies() -> [Title] {
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
        return favoriteMovies
    }
    
    private func fetchTrailer() {
            guard let movie = selectedMovie, let title = movie.original_title else { return }

            APICaller.shared.getMovie(with: title + " trailer") { [weak self] result in
                switch result {
                case .success(let videoElement):
                    DispatchQueue.main.async {
                        let videoID = videoElement.id.videoId
                        let embedHTML = """
                        <iframe width="100%" height="100%" src="https://www.youtube.com/embed/\(videoID)" frameborder="0" allowfullscreen></iframe>
                        """
                        self?.trailerWebView.loadHTMLString(embedHTML, baseURL: nil)
                        self?.trailerWebView.isHidden = false
                    }
                case .failure(let error):
                    print("Failed to fetch YouTube trailer: \(error.localizedDescription)")
                }
            }
        }
}
