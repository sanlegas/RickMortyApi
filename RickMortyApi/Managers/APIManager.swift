//
//  APIManager.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 23/08/22.
//

import Foundation

class APIManager{
    
    static let shared = {APIManager() }()
    
    lazy var baseURL: String = {
        return "https://rickandmortyapi.com/api/"
    }()
    
    lazy var characteres: String = {
        return self.baseURL + "character"
    }()
}
