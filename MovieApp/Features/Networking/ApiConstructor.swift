

import Foundation


typealias Parameters = [String: String]

struct ApiConstructor {
    let endpoint: Endpoint
    var params: Parameters = [:]
}

