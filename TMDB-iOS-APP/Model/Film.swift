//
//  Film.swift
//  TMDB-iOS-APP
//
//  Created by Fatih Kahraman on 11.09.2024.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let popularity: Int
    let voteAverage: Int
    let voteCount: Int
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
