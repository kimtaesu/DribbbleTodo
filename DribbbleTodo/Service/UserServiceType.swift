//
//  UserService.swift
//  DribbbleTodo
//
//  Created by tskim on 02/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import FirebaseAuth
import Foundation

protocol UserServiceType {
    func isLogin() -> Bool
}

extension UserServiceType {
    var user: User? {
        return Auth.auth().currentUser
    }
}
