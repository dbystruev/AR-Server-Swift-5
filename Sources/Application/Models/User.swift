import Foundation
import SwiftKueryORM

struct User: Codable {
    let username: String
    let password: String
    let salt: String
}

extension User: Model {}
