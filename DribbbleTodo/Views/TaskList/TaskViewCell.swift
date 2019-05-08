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
        static let checkBoxWidth: CGFloat = 30
    }
    
    let checkBox = CheckBox()
    let titleView = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        checkBox.do {
            contentView.addSubview($0)
            $0.snp.makeConstraints {
                let width = Metric.checkBoxWidth
                $0.width.equalTo(width)
                $0.height.equalTo(width)
                $0.leading.equalToSuperview()
                $0.centerY.equalToSuperview()
            }
        }
        titleView.do {
            contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.leading.equalTo(checkBox.snp.trailing)
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return layoutAttributes
    }
}

extension TaskViewCell: View, HasDisposeBag {
    func bind(reactor: TaskViewCellReactor) {
        self.checkBox.isChecked = reactor.currentState.isDone
        self.titleView.text = reactor.currentState.title
    }
}
