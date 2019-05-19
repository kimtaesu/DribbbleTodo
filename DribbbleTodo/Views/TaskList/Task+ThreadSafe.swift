//
//  Task+ThreadSafe.swift
//  DribbbleTodo
//
//  Created by tskim on 19/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RealmSwift

extension Task {
    var threadSafeTask: Task? {
        let taskRef = ThreadSafeReference(to: self)
        let realm = try? Realm()
        guard let task = realm?.resolve(taskRef) else { return nil }
        return task
    }
}
