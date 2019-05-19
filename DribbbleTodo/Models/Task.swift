//
//  Task.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object, Encodable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var isDone = false
    @objc dynamic var createdAt = Date()

    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func sortKey() -> String {
        return "createdAt"
    }
}
