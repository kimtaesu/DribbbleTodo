//
//  TaskEditReactor.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

class TaskEditReactor: Reactor {
    let initialState: State = State(title: "", desc: "")

    let taskService: TaskServiceType

    init(_ taskService: TaskServiceType) {
        self.taskService = taskService
    }

    enum Action {
        case setTitle(String?)
        case setDesc(String?)
        case clicksDone
        case saveTasks
    }
    struct State {
        var title: String
        var desc: String

        var alertView: UIAlertComponent?
        var doneTask: Task?
        
        public init(title: String, desc: String) {
            self.title = title
            self.desc = desc
        }
    }
    enum Mutation {
        case setTitle(String?)
        case setDesc(String?)
        case setDone(Task)
        case setError(Error)
        case setShowEmptyContents
    }
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .setTitle(let title):
            return .just(.setTitle(title))
        case .setDesc(let desc):
            return .just(.setDesc(desc))
        case .saveTasks:
            let task = Task().then {
                $0.title = currentState.title
                $0.desc = currentState.desc
            }
            return self.taskService.addTask(task).map { result in
                do {
                    return Mutation.setDone(try result.get())
                } catch let e {
                    return Mutation.setError(e)
                }
            }
        case .clicksDone:
            if currentState.title.isEmpty && currentState.desc.isEmpty {
                return .just(.setShowEmptyContents)
            } else {
                return mutate(action: .saveTasks)
            }
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        newState.alertView = nil
        newState.doneTask = nil

        switch mutation {
        case .setTitle(let title):
            newState.title = title ?? ""
        case .setDesc(let desc):
            newState.desc = desc ?? ""
        case .setShowEmptyContents:
            newState.alertView = UIAlertComponent(
                title: L10n.uiAlertNoticeTitle,
                message: L10n.uiAlertEmptyContents,
                actions: [
                    UIAlertActionComponent(title: L10n.uiAlertCancelTitle, style: .cancel),
                    UIAlertActionComponent(title: L10n.uiAlertOkTitle, action: { [weak self] _ in
                        self?.action.onNext(.saveTasks)
                    })
                ]
            )
        case .setError(let error):
            newState.alertView = UIAlertComponent(
                title: L10n.uiAlertWarningTitle,
                message: L10n.errorCreateTask(error.localizedDescription)
            )
        case let .setDone(task):
            newState.doneTask = task
        }
        return newState
    }
}
