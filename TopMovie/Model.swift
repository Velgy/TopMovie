//
//  Model.swift
//  TopMovie
//
//  Created by Valentin on 16.06.2021.
//

import Foundation

struct Response: Codable {
    let results: [Result]
}

struct Result: Codable {
    
    let title: String
    let overview: String
    let voteAverage: Double
    let releaseDate: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case title, overview
    }
}
