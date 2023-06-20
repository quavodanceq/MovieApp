import UIKit
import SnapKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    var movie: Movie?
    
    let imageView = UIImageView()
    
    let movieNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    convenience init(movie: Movie) {
        self.init()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        contentView.addSubview(imageView)
        
        contentView.addSubview(movieNameLabel)
        
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.layer.cornerCurve = .continuous
        imageView.backgroundColor = .black

        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie!.posterPath)") {
            imageView.sd_setImage(with: url)
        }
        
        
        contentView.addSubview(movieNameLabel)
        
        movieNameLabel.text = movie?.title ?? "Movie"
        movieNameLabel.numberOfLines = 2
        movieNameLabel.textColor = .white
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
       
    }

}
