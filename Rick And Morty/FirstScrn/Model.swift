//
//  Model.swift
//  Rick And Morty
//
//  Created by Huseyn Hasanov on 27.10.22.
//

import Foundation

// MARK: - Data
struct Data: Codable {
    let info: Info?
    var results: [Result]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}


// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}
