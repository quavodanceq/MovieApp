import Foundation
import UIKit
import SnapKit
import SDWebImage

class MovieInfoViewController: UIViewController {
    
    let movie: Movie
    
    let imageView = UIImageView()
    
    let movieNameLabel = UILabel()
    
    let movieRatingLabel = UILabel()
    
    let starRatingView = StarRatingView()
    
    let ratingStackView = UIStackView()
    
    let movieOverviewLabel = UILabel()

    init(movie: Movie) {
        
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .customBackgroundColor
        setupImageView()
        setupMovieNameLabel()
        setupRatingStackView()
        setupMovieOverviewLabel()
        setupConstraints()
    }
    
    private func setupImageView() {
        if let urlPath = URL(string: "https://image.tmdb.org/t/p/w500\(String(describing: movie.posterPath))") {
            imageView.sd_setImage(with: urlPath)
        }
        
    }
    
    private func setupMovieNameLabel() {
        movieNameLabel.font = UIFont.systemFont(ofSize: 30)
        movieNameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        movieNameLabel.text = movie.title
        movieNameLabel.textColor = .white
        movieNameLabel.textAlignment = .center
        movieNameLabel.numberOfLines = 2
    }
    
    private func setupMovieRatingLabel() {
        let roundedValue = round(movie.voteAverage * 10) / 10.0
        movieRatingLabel.text = "Rating - \(roundedValue)"
        movieRatingLabel.font = UIFont.systemFont(ofSize: 25)
        movieRatingLabel.textAlignment = .center
        movieRatingLabel.textColor = .white
    }
    
    private func setupStarRatingView() {
        let rating = Float(movie.voteAverage / 10 * 5)
        starRatingView.rating = rating
        starRatingView.starColor = .customYellow
    }
    
    private func setupMovieOverviewLabel() {
        movieOverviewLabel.text = movie.overview
        movieOverviewLabel.font = UIFont.systemFont(ofSize: 22)
        movieOverviewLabel.textColor = .gray
        movieOverviewLabel.numberOfLines = 0
    }
    
    private func setupRatingStackView() {
        let roundedValue = round(movie.voteAverage * 10) / 10.0
        movieRatingLabel.text = "\(roundedValue)"
        movieRatingLabel.font = UIFont.systemFont(ofSize: 20)
        movieRatingLabel.textColor = .customYellow
        
        let rating = Float(movie.voteAverage / 10 * 5)
        starRatingView.rating = rating
        starRatingView.starColor = .customYellow
        
        ratingStackView.addArrangedSubview(movieRatingLabel)
        ratingStackView.addArrangedSubview(starRatingView)
        ratingStackView.axis = .horizontal
        ratingStackView.alignment = .leading
        ratingStackView.distribution = .equalCentering
        ratingStackView.spacing = 10
        
        
    }
    
    private func setupConstraints() {
        
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        view.addSubview(movieNameLabel)
        
        movieNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(imageView.snp.bottom).offset(-10)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        view.addSubview(ratingStackView)
        
        ratingStackView.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(movieOverviewLabel)
        
        movieOverviewLabel.snp.makeConstraints { make in
            make.top.equalTo(movieRatingLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            
        
        }
        
    }
    
}
