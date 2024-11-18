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
    
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var movieReleaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    /// Configures the cell with the provided movie information.
    ///
    /// - Parameter movie: The `Movie` object containing the details to be displayed in the cell.
    func configure(with movie: Movie) {
        movieNameLabel.text = movie.title
        movieReleaseDateLabel.text = movie.releaseDate
        movieImageView.image = UIImage(systemName: "photo")
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
