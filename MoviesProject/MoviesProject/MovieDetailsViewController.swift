//
//  MovieDetailsViewController.swift
//  MoviesProject
//
//  Created by Тулепберген Анель  on 25.12.2024.
//

import UIKit
struct Movie {
    let title: String
    let rating: String
    let imageUrl: String
}


class MovieDetailsViewController: UIViewController {
    var movie: Movie? // Фильм, переданный с первого экрана

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка элементов
        if let movie = movie {
            movieTitleLabel.text = movie.title
            movieDescriptionLabel.text = "Описание фильма..."
            // Загрузка изображения
            if let url = URL(string: movie.imageUrl) {
                let data = try? Data(contentsOf: url)
                if let data = data {
                    movieImageView.image = UIImage(data: data)
                }
            }
        }
    }
}

