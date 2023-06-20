import Foundation

struct Result: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct Movie: Codable {
   
    let id: Int
    let title: String
    let originalTitle, overview, posterPath: String
    let popularity: Double
    let releaseDate: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case fi = "fi"
    case ja = "ja"
}











