//
//  MovieTableViewCell.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

/// A custom table view cell used to display movie information in a list.
/// This cell is part of the movie list module.
///
/// - Note: Ensure that this cell is registered with the table view before use.
class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.layer.cornerRadius = 4
            movieImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet private weak var movieRateView: RateView!

    @IBOutlet private weak var movieNameLabel: UILabel! {
        didSet {
            movieNameLabel.font = UIFont.H2
        }
    }
    @IBOutlet private weak var movieReleaseDateLabel: UILabel! {
        didSet {
            movieReleaseDateLabel.font = UIFont.lightText
        }
    }
    @IBOutlet private weak var movieVoteLabel: UILabel! {
        didSet {
            movieVoteLabel.font = UIFont.lightText
        }
    }
    @IBOutlet weak var movieDescriptionLabel: UILabel! {
        didSet {
            movieDescriptionLabel.font = UIFont.bodyText
        }
    }

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, yyyy"
        return formatter
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .none
    }

    /// Configures the cell with the provided movie information.
    ///
    /// - Parameter movie: The `Movie` object containing the details to be displayed in the cell.
    func configure(with movie: Movie) {
        movieNameLabel.text = movie.title
        movieReleaseDateLabel.text = movie.releaseDate
        movieImageView.image = UIImage(systemName: "photo")
        let progress: Float = Float(round((movie.voteAverage / 10) * 100) / 100)
        movieRateView.progress = progress
        movieVoteLabel.text = "\(movie.voteCount)"
        movieDescriptionLabel.text = movie.overview

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: movie.releaseDate) {
            movieReleaseDateLabel.text = MovieTableViewCell.dateFormatter.string(from: date)
        } else {
            movieReleaseDateLabel.text = "No disponible"
        }
    }

    /// Sets the image of the cell to the provided image.
    ///
    /// - Parameter image: The image to be displayed in the cell.
    func setImage(image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            self?.movieImageView.image = image
        }
    }
}
