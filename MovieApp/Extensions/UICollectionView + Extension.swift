import Foundation
import UIKit

extension UICollectionView {
    
    func setup() {
        showsHorizontalScrollIndicator = false
        contentInset.left = 10
        backgroundColor = .customBackgroundColor
        register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }
    
}
