//
//  SplashViewController.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import UIKit
import ReactorKit

class SplashViewController: UIViewController {
    
    struct Dependency {
        let reactor: SplashReactor
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
        
    }
}
