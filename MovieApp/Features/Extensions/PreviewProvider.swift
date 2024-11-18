

import SwiftUI

extension PreviewProvider {
    static var dev : DeveloperPreview {
        DeveloperPreview.instance
    }
}


class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {
        
    }
    
    let movie: Movie = Movie(
        adult: false, 
        backdropPath: "/oOv2oUXcAaNXakRqUPxYq5lJURz.jpg",
        genreIDS: [
            18,
            28,
            80,
            53
        ],
        id: 155,
        originalLanguage: "en",
        originalTitle: "The Dark Knight",
        overview: "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
        popularity: 166.719,
        posterPath: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
        releaseDate: "2008-07-16",
        title: "The Dark Knight",
        video: false,
        voteAverage: 8.5,
        voteCount: 32839
    )
    
    
    let genre = Genre(id: 28, name: "Action")
    
    let review = Review(author: "CinemaSerf", authorDetails: nil, content: "Test content", createdAt: "2023", id: "634492", updatedAt: "Test", url: "Test")
}

