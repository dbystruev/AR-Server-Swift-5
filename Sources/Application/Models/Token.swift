import Foundation
import SwiftKueryORM

struct Token: Codable {
    let token: UUID
    let username: String
    let expiry: Date
}

extension Token: Model {}
