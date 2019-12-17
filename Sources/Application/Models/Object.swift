import Foundation
import SwiftKueryORM

struct Object: Codable {
    let user: String
    let url: URL
    let date: Date
}

extension Object: Model {}
