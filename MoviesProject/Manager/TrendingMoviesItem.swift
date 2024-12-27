import Foundation

// Ответ от API с трендовыми фильмами
struct TrendingTitleResponse: Codable {
    let results: [Title] // Список фильмов
}

// Структура для описания фильма
struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let original_language: String?
    let release_date: String?
    let vote_average: Double
}
