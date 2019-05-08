//
//  SummuryDateView.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RxDataSources
import UIKit

class CalendarWeekView: UIView {

    let dayCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(CalendarDayOfWeekCell.self, forCellWithReuseIdentifier: CalendarDayOfWeekCell.swiftIdentifier)
        collectionView.register(CalendarHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalendarHeader.swiftIdentifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    let dataSource = RxCollectionViewSectionedAnimatedDataSource<CarlendarDayOfWeekSection>(
        configureCell: { ds, cv, ip, item in
            guard let cell = cv.dequeueReusableCell(withReuseIdentifier: CalendarDayOfWeekCell.swiftIdentifier, for: ip) as? CalendarDayOfWeekCell else {
                return UICollectionViewCell()
            }
            cell.reactor = CalendarDayOfWeekReactor(item)
            return cell
        },
        configureSupplementaryView: { ds, cv, kind, ip in
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = cv.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CalendarHeader.swiftIdentifier, for: ip) as? CalendarHeader else {
                    return UICollectionReusableView()
                }
                header.configCell()
                return header
            default:
                return UICollectionReusableView()
            }
        }
    )

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        dayCollectionView.do {
            addSubview($0)
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }
}
