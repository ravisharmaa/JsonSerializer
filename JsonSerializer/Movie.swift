//
//  Movie.swift
//  JsonSerializer
//
//  Created by Ravi Bastola on 5/4/19.
//  Copyright © 2019 Ravi Bastola. All rights reserved.
//

import Foundation

struct Movie: Decodable  {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Results]
}

struct Results: Decodable {
    let vote_count :Int
    let id: Int
    let video: Bool
    let vote_average: Float
    let title: String
    let popularity: Double
    let poster_path: String
    let original_language: String
    let original_title: String
    let genre_ids: [Int]
    let backdrop_path: String
    let adult: Bool
    let overview: String
    let release_date: String
    
}
