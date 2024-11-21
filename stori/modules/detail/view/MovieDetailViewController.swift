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
    @IBOutlet private weak var containerRegionView: UIView!
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var budgetLabel: UILabel!
    @IBOutlet private weak var originalLanguageLabel: UILabel!
    @IBOutlet private weak var revenueLabel: UILabel!

    // MARK: - IBAction
    @IBAction func back(_ sender: Any) {
        presenter?.back()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchFullDetail()
        presenter?.viewDidLoad()
        configureUI()
        configure()

    }

    /// Configures the UI elements with the appropriate fonts.
    private func configureUI() {
        titleLabel.font = UIFont.H1
        taglineLabel.font = UIFont.tagline
        regionLabel.font = UIFont.H2
        overviewLabel.font = UIFont.bodyText
        containerRegionView.layer.borderWidth = 2
        containerRegionView.layer.borderColor = UIColor(named: "900")?.cgColor
    }

    /// Configures the view controller with necessary setup.
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
            taglineLabel.text = (movie.tagline == nil || movie.tagline == "") ? "\"...\"" :  movie.tagline
            regionLabel.text = movie.productionCountries?.first?.iso31661 ?? "--"
            overviewLabel.text = movie.overview
            statusLabel.text = movie.status
            budgetLabel.text = movie.budget == 0 ? "--" : "$ \(formatNumberWithCommas(movie.budget))"
            originalLanguageLabel.text = movie.originalLanguage.uppercased()
            revenueLabel.text = movie.revenue == 0 ? "--" : "$ \(formatNumberWithCommas(movie.revenue))"
        }
    }

    private func formatNumberWithCommas(_ number: Int?) -> String {
        if let number = number{
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
        } else {
            return "--"
        }

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

    func showError(message: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
