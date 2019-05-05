//
//  UICollectionView+Cell.swift
//  DribbbleTodoTests
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func cell<T>(_ indexPath: IndexPath) -> T where T: UICollectionViewCell {
        return self.cellForItem(at: indexPath) as! T
    }
}
