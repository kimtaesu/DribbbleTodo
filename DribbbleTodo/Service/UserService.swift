//
//  UserService.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import FirebaseAuth
import Foundation

class UserService: UserServiceType {
    func isLogin() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    
}
