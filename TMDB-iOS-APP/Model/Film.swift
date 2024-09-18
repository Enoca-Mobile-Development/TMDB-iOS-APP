//
//  Film.swift
//  TMDB-iOS-APP
//
//  Created by Fatih Kahraman on 11.09.2024.
//

import Foundation

struct Movie: Codable,Identifiable, Equatable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let popularity: Double
    let voteAverage: Double
    let voteCount: Double
    let language: String


    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "original_title"
        case language = "original_language"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case popularity = "popularity"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"


    }
    
}

struct NowPlayingResponse: Decodable {
    let results: [Movie]
}

struct PopularResponse: Decodable {
    let results: [Movie]
}

struct TopRatedResponse: Decodable {
    let results: [Movie]
}

struct UpcomingResponse: Decodable {
    let results: [Movie]
}
