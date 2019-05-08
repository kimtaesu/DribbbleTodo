//
//  TaskDayCell.swift
//  DribbbleTodo
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import UIKit

class CalendarDayOfWeekCell: UICollectionViewCell, SwiftNameIdentifier {
    
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateLabel.do {
            contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalendarDayOfWeekCell: View, HasDisposeBag {
    func bind(reactor: CalendarDayOfWeekReactor) {
    }
}
