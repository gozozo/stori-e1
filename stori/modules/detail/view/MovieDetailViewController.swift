//
//  MovieDetailViewController.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var presenter: MovieDetailPresenterProtocol?

    @IBOutlet private weak var backdropImageView: UIImageView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configure()
    }

    /**
     Configures the view controller with necessary setup.
     */
    private func configure() {
        titleLabel.text = presenter?.getTitle()
        titleLabel.font = UIFont.H1
        taglineLabel.font = UIFont.tagline
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func displayPosterImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.posterImageView.image = image
        }
    }

    func displayBackdropImage(_ image: UIImage?) {
        DispatchQueue.main.async {
            self.backdropImageView.image = image}
    }
}
