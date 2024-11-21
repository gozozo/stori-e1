//
//  MovieListViewController.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import UIKit

/// A view controller that manages the movie list view.
///
/// This class is responsible for displaying a list of movies to the user.
/// It inherits from `UIViewController` and contains the necessary logic to
/// handle the presentation and interaction with the movie list.
class MovieListViewController: UIViewController {

    var presenter: MovieListPresenterProtocol?

    @IBOutlet private weak var containerTable: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureNavigationBar()
        presenter?.fetchMovies()
    }

    /// Configures the views for the MovieListViewController.
    ///
    /// This method sets up the appearance and behavior of the views,
    /// including the table view and other UI.
    ///
    private func configureViews() {
        //Title
        titleLabel.font = UIFont.H1
        //Table
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }

    /// Configures the navigation bar for the MovieListViewController.
    /// This method sets up the appearance and behavior of the navigation bar,
    /// including title, buttons, and other navigation-related elements.
    private func configureNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension MovieListViewController: MovieListViewProtocol {

    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError(message: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

extension MovieListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfMovies() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell,
              let movie = presenter?.movie(at: indexPath.row) else {
            return UITableViewCell()
        }
        cell.configure(with: movie)
        presenter?.fetchImageMovie(for: movie.posterPath, completion: { image in
            cell.setImage(image: image ?? UIImage())
        })
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        if position > contentHeight - scrollViewHeight - 50 {
            presenter?.fetchMovies()
        }
    }
}

extension MovieListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToMovieDetail(at: indexPath.row)
    }
}
