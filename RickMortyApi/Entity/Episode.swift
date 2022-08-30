//
//  Episode.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 29/08/22.
//

import Foundation
struct Episode: Decodable{
    let id:Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}
