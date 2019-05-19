//
//  SplashViewController.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import UIKit

class SplashViewController: UIViewController {
    
    struct Dependency {
        let reactor: SplashReactor
        let presentLogin: () -> Void
        let presnetMain: () -> Void
    }
    
    private let dependency: Dependency
    
    init(_ dependency: Dependency) {
        defer { self.reactor = dependency.reactor }
        self.dependency = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SplashViewController: View, HasDisposeBag {
    func bind(reactor: SplashReactor) {
        self.rx.viewDidAppear
            .map { _ in Reactor.Action.checkIfAuthenticated }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.authenticated }
            .filterNil()
            .distinctUntilChanged()
            .bind { [weak self] isAuthenticated in
                guard let self = self else { return }
                if isAuthenticated {
                    self.dependency.presnetMain()
                } else {
                    self.dependency.presentLogin()
                }
            }
            .disposed(by: disposeBag)
    }
}
