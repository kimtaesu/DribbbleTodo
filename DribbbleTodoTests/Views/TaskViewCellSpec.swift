//
//  TaskViewCellSpec.swift
//  DribbbleTodoTests
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Nimble
import Quick
import UIKit
@testable import DribbbleTodo
class TaskViewCellSpec: QuickSpec {
    override func spec() {
        var view: TaskViewCell!
        var reactor: TaskViewCellReactor!
        
        beforeEach {
            view = TaskViewCell()
        }
        
        describe("A TaskViewCell") {
            it("bind view model") {
                let viewModel = TaskViewModel(id: "0", title: "test", isDone: true, createdAt: Date())
                reactor = TaskViewCellReactor(viewModel)
                view.bind(reactor: reactor)
                
                expect(view.checkBox.isChecked) == viewModel.isDone
                expect(view.titleView.text) == viewModel.title
            }
        }
    }
}


