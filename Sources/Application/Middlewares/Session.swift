//
//  Session.swift
//  ARServer
//
//  Created by Denis Bystruev on 26.12.2019.
//

import KituraSession

final class Session: TypeSafeSession {
    var sessionId: String
    var objects: [Object]
    
    init(sessionId: String) {
        self.sessionId = sessionId
        objects = []
    }
}

extension Session {
    static var store: Store?
    static var sessionCookie: SessionCookie = SessionCookie(name: "UserObjects", secret: "Secret key to encrypt cookie")
}
