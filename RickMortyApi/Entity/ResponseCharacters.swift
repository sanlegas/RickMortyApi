//
//  ResponseCharacters.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 27/08/22.
//

import Foundation

struct ResponseCharacters:Decodable {
    let info: Info
    let results: [Character]
}


struct Info: Decodable{
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}
