//
//  Character.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 25/08/22.
//

import Foundation
struct Character: Decodable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    var firstEpisode: String?
    var avatar: Data?
    let url: String
}

struct Origin: Decodable{
    let name: String
    let url: String
}

struct Location: Decodable{
    let name: String
    let url: String
}

