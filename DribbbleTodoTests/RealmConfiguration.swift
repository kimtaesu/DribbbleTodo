//
//  RealmConfiguration.swift
//  DribbbleTodoTests
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Quick
import RealmSwift
@testable import DribbbleTodo

class RealmConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        configuration.beforeEach {
            self.useTestDatabase()
        }
        
        configuration.afterEach {
            self.clearDatabase()
        }
    }
}

extension RealmConfiguration {
    class func useTestDatabase() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "Test"
    }
    
    class func clearDatabase() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
