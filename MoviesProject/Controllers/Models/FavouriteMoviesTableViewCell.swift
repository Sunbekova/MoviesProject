//
//  FavouriteMoviesTableViewCell.swift
//  MoviesProject
//
//  Created by Тулепберген Анель  on 26.12.2024.
//

import UIKit
import Kingfisher

class FavouriteMoviesTableViewCell: UITableViewCell {

    static let identifier = "FavouriteMoviesTableViewCell"

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    // Метод для настройки ячейки
    func configure(with model: Title) {
        titleLabel.text = model.original_title ?? model.original_name ?? "Unknown Title"
        ratingLabel.text = "\(String(format: "%.1f", model.vote_average))"
        
        if let posterPath = model.poster_path {
            let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            posterImageView.kf.setImage(with: imageURL)
        } else {
            posterImageView.image = UIImage(systemName: "photo.artframe")
        }

        releaseDate.text = model.release_date ?? "Unknown Release Date"
        runtimeLabel.text = model.original_language ?? "Unknown Error"
    }

    static func nib() -> UINib {
        return UINib(nibName: "FavouriteMoviesTableViewCell", bundle: nil)
    }
}
