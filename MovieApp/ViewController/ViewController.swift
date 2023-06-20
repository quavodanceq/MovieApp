import UIKit
import SnapKit
import Combine

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    private let trendingLabel = UILabel()
    
    private let topRatedLabel = UILabel()
    
    private var trendingMovies: UICollectionView!
    
    private var topRatedMovies: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupLabels()
        setupCollectionViews()
        setupConstraints()
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "MovieApp"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.customRed]
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(.white)
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupLabels() {
        trendingLabel.text = "Trending movies"
        trendingLabel.font = UIFont.boldSystemFont(ofSize: 25)
        trendingLabel.textColor = .white
        topRatedLabel.text = "Top rated movies"
        topRatedLabel.textColor = .white
        topRatedLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    private func setupCollectionViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        trendingMovies = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        topRatedMovies = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        self.view.addSubview(trendingMovies ?? UICollectionView())
        self.view.addSubview(topRatedMovies ?? UICollectionView())
        view.backgroundColor = .customBackgroundColor
        trendingMovies.setup()
        topRatedMovies.setup()
        trendingMovies?.delegate = self
        trendingMovies?.dataSource = self
        topRatedMovies?.delegate = self
        topRatedMovies?.dataSource = self
        
    }
    
    private func setupConstraints() {
        
        view.addSubview(trendingLabel)
        
        trendingLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        trendingMovies?.snp.makeConstraints { make in
            make.top.equalTo(trendingLabel.snp.bottom).offset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        view.addSubview(topRatedLabel)
        
        topRatedLabel.snp.makeConstraints { make in
            make.top.equalTo(trendingMovies.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        topRatedMovies?.snp.makeConstraints({ make in
            make.top.equalTo(topRatedLabel.snp.bottom).offset(10)
            make.height.equalToSuperview().multipliedBy(0.25)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        })
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == trendingMovies {
            return viewModel.trendingMovies.count
        } else {
            return viewModel.topRatedMovies.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == trendingMovies {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
            cell.movie = viewModel.trendingMovies[indexPath.row]
            cell.setupConstraints()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
            cell.movie = viewModel.topRatedMovies[indexPath.row]
            cell.setupConstraints()
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == trendingMovies {
            let movie = viewModel.trendingMovies[indexPath.row]
            navigationController?.pushViewController(MovieInfoViewController(movie: movie), animated: true)
        } else {
            let movie = viewModel.topRatedMovies[indexPath.row]
            navigationController?.pushViewController(MovieInfoViewController(movie: movie), animated: true)
        }

    }
    
}

extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == trendingMovies {
            return CGSize(width: collectionView.frame.size.width / 2.5 , height: collectionView.frame.size.height)
        } else {
            return CGSize(width: collectionView.frame.size.width / 2.5 , height: collectionView.frame.size.height)
        }
    
    }
}
