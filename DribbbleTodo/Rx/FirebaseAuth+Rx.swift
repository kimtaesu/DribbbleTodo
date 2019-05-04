//
//  AAAA.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import FirebaseAuth
import Foundation
import RxCocoa
import RxSwift

extension Reactive where Base: Auth {
    public func addStateDidChangeListener() -> Observable<(Auth, User?)> {
        return .create { [weak auth = base] observer in
            let handle = auth?.addStateDidChangeListener { observer.onNext(($0, $1)) }
            return Disposables.create {
                if let handle = handle {
                    auth?.removeStateDidChangeListener(handle)
                }
            }
        }
    }
}
