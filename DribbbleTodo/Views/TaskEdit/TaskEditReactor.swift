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
    
    let initialState: State

    init(edit: EditingTask) {
        logger.info("Init editing task: \(edit)")
        self.initialState = State(editingTask: edit)
    }

    enum Action {
        case setTitle(String?)
        case clicksDone
    }
    struct State {
        var editingTask: EditingTask

        public init(editingTask: EditingTask) {
            self.editingTask = editingTask
        }

        var alertView: UIAlertComponent?
        var savedEditingTask: EditingTask?
        var isDelete: Bool?
        
        mutating func disposableState() {
            self.savedEditingTask = nil
            self.alertView = nil
        }
    }
    enum Mutation {
        case setTitle(String)
        case setSaveDone(EditingTask)
        case setError(Error)
        case setShowEmptyAlert
    }
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .setTitle(let title):
            return .just(.setTitle(title ?? ""))
        case .clicksDone:
            if currentState.editingTask.title.isEmpty {
                return .just(.setShowEmptyAlert)
            } else {
                return .just(Mutation.setSaveDone(currentState.editingTask))
            }
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        newState.disposableState()
        
        switch mutation {
        case .setTitle(let title):
            newState.editingTask.title = title
        case .setShowEmptyAlert:
            newState.alertView = UIAlertComponent(
                title: L10n.uiAlertNoticeTitle,
                message: L10n.uiAlertEmptyContents,
                actions: [
                    UIAlertActionComponent(title: L10n.uiAlertOkTitle)
                ]
            )
        case .setError(let error):
            newState.alertView = UIAlertComponent(
                title: L10n.uiAlertWarningTitle,
                message: L10n.errorCreateTask(error.localizedDescription)
            )
        case let .setSaveDone(task):
            newState.savedEditingTask = task
        }
        return newState
    }
}
