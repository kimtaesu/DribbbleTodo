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
        case itemSelected(IndexPath)
        case updateEditingTask(EditingTask)
    }
    struct State {
        var sections: [TaskSection] = []
        var refreshing: Bool = false
        
        var selectedEditingTask: EditingTask?
        
        mutating func disposableState() {
            self.selectedEditingTask = nil
        }
    }
    
    enum Mutation {
        case setRefreshing(Bool)
        case setRefresh([Task])
        case itemSelected(EditingTask?)
    }
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .updateEditingTask(let editing):
            self.taskService.updateIfEmptyAdd(editing: editing)
            return .empty()
        case .itemSelected(let ip):
            let taskViewModel = currentState.sections[ip.section].items[ip.row].editingTask
            return .just(Mutation.itemSelected(taskViewModel))
        case .fetchTasks:
            return Observable.concat([
                Observable.just(.setRefreshing(true)),
                self.taskService.getTasks().map { Mutation.setRefresh($0) },
                Observable.just(.setRefreshing(false))
                ])
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        newState.disposableState()
        switch mutation {
        case .itemSelected(let task):
            newState.selectedEditingTask = task
        case .setRefresh(let tasks):
            newState.sections = [TaskSection(items: tasks.map { $0.viewModel })]
        case .setRefreshing(let loading):
            newState.refreshing = loading
        }
        return newState
    }
}
