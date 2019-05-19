// MARK: - Mocks generated from file: DribbbleTodo/Service/TaskServiceType.swift at 2019-05-19 14:22:55 +0000

//
//  TaskServiceType.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Cuckoo
@testable import DribbbleTodo

import Foundation
import RealmSwift
import RxSwift


 class MockTaskServiceType: TaskServiceType, Cuckoo.ProtocolMock {
     typealias MocksType = TaskServiceType
     typealias Stubbing = __StubbingProxy_TaskServiceType
     typealias Verification = __VerificationProxy_TaskServiceType

    private var __defaultImplStub: TaskServiceType?

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

     func enableDefaultImplementation(_ stub: TaskServiceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    
    
     var realm: Realm {
        get {
            return cuckoo_manager.getter("realm",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.realm)
        }
        
    }
    

    

    
    
    
     func getTasks()  -> Observable<[Task]> {
        
            return cuckoo_manager.call("getTasks() -> Observable<[Task]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getTasks())
        
    }
    
    
    
     func updateIfEmptyAdd(task: Task)  -> Observable<Result<Task, Error>> {
        
            return cuckoo_manager.call("updateIfEmptyAdd(task: Task) -> Observable<Result<Task, Error>>",
                parameters: (task),
                escapingParameters: (task),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.updateIfEmptyAdd(task: task))
        
    }
    
    
    
     func updateIfEmptyAdd(editing: EditingTask)  -> Observable<Result<Task, Error>> {
        
            return cuckoo_manager.call("updateIfEmptyAdd(editing: EditingTask) -> Observable<Result<Task, Error>>",
                parameters: (editing),
                escapingParameters: (editing),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.updateIfEmptyAdd(editing: editing))
        
    }
    
    
    
     func getTaskById(_ id: String)  -> Task? {
        
            return cuckoo_manager.call("getTaskById(_: String) -> Task?",
                parameters: (id),
                escapingParameters: (id),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getTaskById(id))
        
    }
    

	 struct __StubbingProxy_TaskServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var realm: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockTaskServiceType, Realm> {
	        return .init(manager: cuckoo_manager, name: "realm")
	    }
	    
	    
	    func getTasks() -> Cuckoo.ProtocolStubFunction<(), Observable<[Task]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTaskServiceType.self, method: "getTasks() -> Observable<[Task]>", parameterMatchers: matchers))
	    }
	    
	    func updateIfEmptyAdd<M1: Cuckoo.Matchable>(task: M1) -> Cuckoo.ProtocolStubFunction<(Task), Observable<Result<Task, Error>>> where M1.MatchedType == Task {
	        let matchers: [Cuckoo.ParameterMatcher<(Task)>] = [wrap(matchable: task) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTaskServiceType.self, method: "updateIfEmptyAdd(task: Task) -> Observable<Result<Task, Error>>", parameterMatchers: matchers))
	    }
	    
	    func updateIfEmptyAdd<M1: Cuckoo.Matchable>(editing: M1) -> Cuckoo.ProtocolStubFunction<(EditingTask), Observable<Result<Task, Error>>> where M1.MatchedType == EditingTask {
	        let matchers: [Cuckoo.ParameterMatcher<(EditingTask)>] = [wrap(matchable: editing) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTaskServiceType.self, method: "updateIfEmptyAdd(editing: EditingTask) -> Observable<Result<Task, Error>>", parameterMatchers: matchers))
	    }
	    
	    func getTaskById<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.ProtocolStubFunction<(String), Optional<Task>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTaskServiceType.self, method: "getTaskById(_: String) -> Task?", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TaskServiceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var realm: Cuckoo.VerifyReadOnlyProperty<Realm> {
	        return .init(manager: cuckoo_manager, name: "realm", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func getTasks() -> Cuckoo.__DoNotUse<Observable<[Task]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getTasks() -> Observable<[Task]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func updateIfEmptyAdd<M1: Cuckoo.Matchable>(task: M1) -> Cuckoo.__DoNotUse<Observable<Result<Task, Error>>> where M1.MatchedType == Task {
	        let matchers: [Cuckoo.ParameterMatcher<(Task)>] = [wrap(matchable: task) { $0 }]
	        return cuckoo_manager.verify("updateIfEmptyAdd(task: Task) -> Observable<Result<Task, Error>>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func updateIfEmptyAdd<M1: Cuckoo.Matchable>(editing: M1) -> Cuckoo.__DoNotUse<Observable<Result<Task, Error>>> where M1.MatchedType == EditingTask {
	        let matchers: [Cuckoo.ParameterMatcher<(EditingTask)>] = [wrap(matchable: editing) { $0 }]
	        return cuckoo_manager.verify("updateIfEmptyAdd(editing: EditingTask) -> Observable<Result<Task, Error>>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getTaskById<M1: Cuckoo.Matchable>(_ id: M1) -> Cuckoo.__DoNotUse<Optional<Task>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
	        return cuckoo_manager.verify("getTaskById(_: String) -> Task?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class TaskServiceTypeStub: TaskServiceType {
    
     var realm: Realm {
        get {
            return DefaultValueRegistry.defaultValue(for: (Realm).self)
        }
        
    }
    

    

    
     func getTasks()  -> Observable<[Task]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Task]>.self)
    }
    
     func updateIfEmptyAdd(task: Task)  -> Observable<Result<Task, Error>> {
        return DefaultValueRegistry.defaultValue(for: Observable<Result<Task, Error>>.self)
    }
    
     func updateIfEmptyAdd(editing: EditingTask)  -> Observable<Result<Task, Error>> {
        return DefaultValueRegistry.defaultValue(for: Observable<Result<Task, Error>>.self)
    }
    
     func getTaskById(_ id: String)  -> Task? {
        return DefaultValueRegistry.defaultValue(for: Optional<Task>.self)
    }
    
}


// MARK: - Mocks generated from file: DribbbleTodo/Service/UserServiceType.swift at 2019-05-19 14:22:55 +0000

//
//  UserService.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Cuckoo
@testable import DribbbleTodo

import FirebaseAuth
import Foundation


 class MockUserServiceType: UserServiceType, Cuckoo.ProtocolMock {
     typealias MocksType = UserServiceType
     typealias Stubbing = __StubbingProxy_UserServiceType
     typealias Verification = __VerificationProxy_UserServiceType

    private var __defaultImplStub: UserServiceType?

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

     func enableDefaultImplementation(_ stub: UserServiceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    
    
     func isLogin()  -> Bool {
        
            return cuckoo_manager.call("isLogin() -> Bool",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isLogin())
        
    }
    

	 struct __StubbingProxy_UserServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func isLogin() -> Cuckoo.ProtocolStubFunction<(), Bool> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockUserServiceType.self, method: "isLogin() -> Bool", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_UserServiceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func isLogin() -> Cuckoo.__DoNotUse<Bool> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("isLogin() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class UserServiceTypeStub: UserServiceType {
    

    

    
     func isLogin()  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}

