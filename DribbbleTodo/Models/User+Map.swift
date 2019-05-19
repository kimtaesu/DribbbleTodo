//
//  User+Map.swift
//  DribbbleTodo
//
//  Created by tskim on 04/05/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import FirebaseAuth
import Foundation

extension User {
    var me: Me {
        return Me(
            email: self.email,
            displayName: self.displayName,
            phoneNumber: self.phoneNumber,
            photoURL: self.photoURL
        )
    }
}
