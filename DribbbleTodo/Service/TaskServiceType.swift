//
//  TaskServiceType.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

protocol TaskServiceType {
    var realm: Realm { get }
    
    func getTasks() -> Observable<[Task]>
    @discardableResult
    func updateIfEmptyAdd(task: Task) -> Observable<Result<Task, Error>>
    func updateIfEmptyAdd(editing: EditingTask) -> Observable<Result<Task, Error>>
    func getTaskById(_ id: String) -> Task?
}
