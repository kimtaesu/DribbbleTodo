//
//  TaskViewCell.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import UIKit

class TaskViewCell: UICollectionViewCell, SwiftNameIdentifier {

    struct Metric {
        static let height: CGFloat = 100
    }

    let titleView = UILabel()
    let roundShadowView = RoundShadowView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        roundShadowView.do {
            $0.backgroundColor = ColorName.bgTaskCell
            $0.cornerRadius = 5.0
            contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        titleView.do {
            roundShadowView.addSubview($0)
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview().inset(10)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        titleView.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.right
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
}
