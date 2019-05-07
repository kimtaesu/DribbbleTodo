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
        case setTitle(String)
        case setDesc(String)
        case clicksDone
        case saveTasks
    }
    struct State {
        var title: String
        var desc: String

        var emptyContentAlertView: UIAlertComponent?
        var done: Bool?

        public init(title: String, desc: String) {
            self.title = title
            self.desc = desc
        }
    }
    enum Mutation {
        case setTitle(String)
        case setDesc(String)
        case setDone
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
            return self.taskService.addTasks([task]).map { _ in Mutation.setDone }
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
        newState.emptyContentAlertView = nil
        newState.done = false

        switch mutation {
        case .setTitle(let title):
            newState.title = title
        case .setDesc(let desc):
            newState.desc = desc
        case .setShowEmptyContents:
            newState.emptyContentAlertView = UIAlertComponent(
                title: L10n.uiAlertNoticeTitle,
                message: L10n.uiAlertEmptyContents,
                actions: [
                    UIAlertActionComponent(title: L10n.uiAlertCancelTitle, style: .cancel),
                    UIAlertActionComponent(title: L10n.uiAlertOkTitle, action: { [weak self] _ in
                        self?.action.onNext(.saveTasks)
                    })
                ]
            )
        case .setDone:
            newState.done = true
        }
        return newState
    }
}
