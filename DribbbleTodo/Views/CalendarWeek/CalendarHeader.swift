//
//  CalendarHeader.swift
//  DribbbleTodo
//
//  Created by tskim on 08/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import UIKit

class CalendarHeader: UICollectionReusableView, SwiftNameIdentifier {
    
    let dayLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dayLabel.do {
            addSubview($0)
            $0.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalendarHeader {
    func configCell() {
        
    }
}
