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
}
