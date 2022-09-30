//
//  Credentials.swift
//  LoginApp
//
//  Created by Дмитрий Никишов on 30.09.2022.
//

import Foundation

struct Credentials {
    var userName: String
    var password: String
}

extension Credentials: Equatable {
    static func == (left: Credentials, right: Credentials) -> Bool {
        return left.password == right.password &&
               left.userName == right.userName
    }
}
