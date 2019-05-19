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

    func getTasks() -> Observable<[Task]> {
        logger.threadName()
        let tasks = self.realm.objects(Task.self).sorted(byKeyPath: Task.sortKey(), ascending: false)
        return Observable.array(from: tasks)
    }
    func updateIfEmptyAdd(editing: EditingTask) -> Observable<Result<Task, Error>> {
        return updateIfEmptyAdd(task: editing.task)
    }
    
    func updateIfEmptyAdd(task: Task) -> Observable<Result<Task, Error>> {
        do {
            try realm.write {
                logger.threadName()
                self.realm.add(task, update: true)
                logger.info("updated: \(task)")
            }
            return .just(Result.success(task))
        } catch let e {
            return .just(Result.failure(e))
        }
    }
    func getTaskById(_ id: String) -> Task? {
        return realm.objects(Task.self).first { $0.id == id }
    }
}
