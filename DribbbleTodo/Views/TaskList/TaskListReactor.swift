//
//  TaskListReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class TaskListReactor: Reactor {
    let initialState: State = State()
    let taskService: TaskServiceType

    init(_ taskService: TaskServiceType) {
        self.taskService = taskService
    }

    enum Action {
        case fetchTasks
    }
    struct State {
        var items: [TaskSection] = []
        var refreshing: Bool = false
    }
    enum Mutation {
        case setRefreshing(Bool)
        case setRefresh([Task])
    }
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .fetchTasks:
            return Observable.concat([
                Observable.just(.setRefreshing(true)),
                self.taskService.fetchTasks().map { Mutation.setRefresh($0) },
                Observable.just(.setRefreshing(false))
                ])
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setRefresh(let tasks):
            newState.items = [TaskSection(items: tasks.map { $0.viewModel })]
        case .setRefreshing(let loading):
            newState.refreshing = loading
        }
        return newState
    }
}
