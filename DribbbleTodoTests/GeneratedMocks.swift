// MARK: - Mocks generated from file: DribbbleTodo/Service/TaskServiceType.swift at 2019-05-07 14:25:37 +0000

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
    

    

    
    
    
     func fetchTasks()  -> Observable<[Task]> {
        
            return cuckoo_manager.call("fetchTasks() -> Observable<[Task]>",
                parameters: (),
                escapingParameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.fetchTasks())
        
    }
    
    
    
     func addTasks(_ tasks: [Task])  -> Observable<Result<[Task], Error>> {
        
            return cuckoo_manager.call("addTasks(_: [Task]) -> Observable<Result<[Task], Error>>",
                parameters: (tasks),
                escapingParameters: (tasks),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.addTasks(tasks))
        
    }
    

	 struct __StubbingProxy_TaskServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var realm: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockTaskServiceType, Realm> {
	        return .init(manager: cuckoo_manager, name: "realm")
	    }
	    
	    
	    func fetchTasks() -> Cuckoo.ProtocolStubFunction<(), Observable<[Task]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTaskServiceType.self, method: "fetchTasks() -> Observable<[Task]>", parameterMatchers: matchers))
	    }
	    
	    func addTasks<M1: Cuckoo.Matchable>(_ tasks: M1) -> Cuckoo.ProtocolStubFunction<([Task]), Observable<Result<[Task], Error>>> where M1.MatchedType == [Task] {
	        let matchers: [Cuckoo.ParameterMatcher<([Task])>] = [wrap(matchable: tasks) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTaskServiceType.self, method: "addTasks(_: [Task]) -> Observable<Result<[Task], Error>>", parameterMatchers: matchers))
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
	    func fetchTasks() -> Cuckoo.__DoNotUse<Observable<[Task]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchTasks() -> Observable<[Task]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addTasks<M1: Cuckoo.Matchable>(_ tasks: M1) -> Cuckoo.__DoNotUse<Observable<Result<[Task], Error>>> where M1.MatchedType == [Task] {
	        let matchers: [Cuckoo.ParameterMatcher<([Task])>] = [wrap(matchable: tasks) { $0 }]
	        return cuckoo_manager.verify("addTasks(_: [Task]) -> Observable<Result<[Task], Error>>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class TaskServiceTypeStub: TaskServiceType {
    
     var realm: Realm {
        get {
            return DefaultValueRegistry.defaultValue(for: (Realm).self)
        }
        
    }
    

    

    
     func fetchTasks()  -> Observable<[Task]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Task]>.self)
    }
    
     func addTasks(_ tasks: [Task])  -> Observable<Result<[Task], Error>> {
        return DefaultValueRegistry.defaultValue(for: Observable<Result<[Task], Error>>.self)
    }
    
}


// MARK: - Mocks generated from file: DribbbleTodo/Service/UserServiceType.swift at 2019-05-07 14:25:37 +0000

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

