//
//  MovieDetailViewController.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 20/11/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var presenter: MovieDetailPresenterProtocol?

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, yyyy"
        return formatter
    }()

    // MARK: - IBOutlet
    @IBOutlet private weak var backdropImageView: UIImageView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rateView: RateView!
    @IBOutlet private weak var votesDateView: VotesDateView!
    @IBOutlet private weak var taglineLabel: UILabel!

    // MARK: - IBAction
    @IBAction func back(_ sender: Any) {
        presenter?.back()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchFullDetail()
        presenter?.viewDidLoad()
        configure()
    }

    /**
     Configures the view controller with necessary setup.
     */
    private func configure() {
        if let movie = presenter?.getMovie(){

            let progress: Float = Float(round((movie.voteAverage / 10) * 100) / 100)
            rateView.progress = progress

            votesDateView.votes = "\(movie.voteCount)"
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd"
            if let date = inputFormatter.date(from: movie.releaseDate) {
                votesDateView.date = MovieDetailViewController.dateFormatter.string(from: date)
            } else {
                votesDateView.date = "--"
            }

            titleLabel.text = movie.title
            taglineLabel.text = ((movie.tagline?.isEmpty) != nil) ? "\"...\"" :  movie.tagline
        }

        titleLabel.font = UIFont.H1
        taglineLabel.font = UIFont.tagline
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    
    func reloadData(){
        DispatchQueue.main.async { [weak self] in
            self?.configure()
        }
    }

    func displayPosterImage(_ image: UIImage?) {
        DispatchQueue.main.async {  [weak self] in
            self?.posterImageView.image = image
        }
    }

    func displayBackdropImage(_ image: UIImage?) {
        DispatchQueue.main.async {  [weak self] in
            self?.backdropImageView.image = image}
    }
}
