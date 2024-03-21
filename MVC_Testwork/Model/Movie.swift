//
//  Movie.swift
//  MVC_Testwork
//
//  Created by Константин Евсюков on 20.03.2024.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let year: Int
    let genre: [String]
    let rating: Double
    let director: String
    let actors: [String]
    let plot: String
    let poster: String
    let awards: String
}
