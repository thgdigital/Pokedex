//
//  HomeEntity.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class HomeEntity: NSObject {
    var count:Int = 0
    var next: String = ""
    var previous: String = ""
    var results: [PokemonHomeEntity] = []
}
