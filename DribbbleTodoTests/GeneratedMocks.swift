// MARK: - Mocks generated from file: DribbbleTodo/Service/UserServiceType.swift at 2019-05-04 10:04:33 +0000

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

