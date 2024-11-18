

import Foundation

// MARK: - Pokedex
struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results 
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath : String?
    let releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


extension Movie {
    var imageUrlString: String {
        Constants.imageBaseUrl + posterPath.stringValue
    }
    
    func getImage(for type: MovieImageType) -> String {
        switch type {
        case .poster:
            return Constants.imageBaseUrl + (posterPath == nil ? backdropPath.stringValue : posterPath.stringValue)
        case .backdrop:
            return Constants.imageBaseUrl + (backdropPath == nil ? posterPath.stringValue : backdropPath.stringValue)
        }
    }
}

enum MovieImageType {
    case poster, backdrop
}


enum MovieCardType {
    case poster, grid
}

extension MovieCardType {
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.45
        case .grid:
            return 0.30
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.30
        case .grid:
            return 0.20
        }
    }
}
