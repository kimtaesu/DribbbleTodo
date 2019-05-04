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
    func fetchTasks() -> Observable<[Task]>
    @discardableResult
    func addTasks(_ tasks: [Task]) -> Observable<Result<[Task], Error>>
}
