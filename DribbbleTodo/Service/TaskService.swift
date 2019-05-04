//
//  TaskService.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class TaskService: TaskServiceType {
    let realm: Realm

    init(_ realm: Realm) {
        self.realm = realm
    }

    func fetchTasks() -> Observable<[Task]> {
        return Observable.just(Array(self.realm.objects(Task.self)))
    }

    func addTasks(_ tasks: [Task]) -> Observable<Result<[Task], Error>> {
        do {
            try realm.write {
                self.realm.add(tasks)
            }
            return .just(Result.success(tasks))
        } catch let e {
            return .just(Result.failure(e))
        }
    }
}
