//
//  HomeModel.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation
 
struct HomeModel: Codable {
    let count:Int
    let next: String?
    let previous: String?
    let results: [PokemonHome]
    
    struct PokemonHome: Codable {
        let name: String
        let url: String
    }
    
}
