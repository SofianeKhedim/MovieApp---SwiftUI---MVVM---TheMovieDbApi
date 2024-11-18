

import Foundation


struct Genre : Identifiable, Codable {
    let id: Int
    let name: String
}


struct GenreResponse: Codable {
    let genres: [Genre]
}
