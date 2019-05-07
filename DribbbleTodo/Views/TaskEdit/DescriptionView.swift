//
//  DescriptionView.swift
//  DribbbleTodo
//
//  Created by tskim on 05/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import UIKit

class DescriptionView: UIView {

    let titleView = UILabel()
    let descTextView = UITextView()

    struct Metric {
        static let descTopBottomInset: CGFloat = 8
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleView.do {
            $0.text = L10n.taskDescriptionsPlaceholder
            $0.textColor = ColorName.taskEditTextColor
            addSubview($0)
            $0.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview()
            }
        }

        descTextView.do {
            $0.backgroundColor = ColorName.bgDesc
            addSubview($0)
            $0.textColor = UIColor.gray
            $0.snp.makeConstraints {
                $0.leading.equalToSuperview()
                $0.centerX.equalToSuperview()
                $0.top.equalTo(titleView.snp.bottom).inset(-Metric.descTopBottomInset)
                $0.bottom.equalToSuperview().inset(Metric.descTopBottomInset)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
