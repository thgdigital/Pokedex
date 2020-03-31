//
//  HomeEntityMapper.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation


class HomeEntityMapper {
    
    static var lastIndex = 0
    
    static func mappingHome(model: HomeModel) -> HomeEntity {
        let entity = HomeEntity()
        entity.count = model.count
        entity.next = model.next ?? ""
        entity.previous = model.previous ?? ""
        entity.results = model.results.enumerated().map({mappingPokemonHome(pokemon: $0.element, index: $0.offset) })
        lastIndex = lastIndex + entity.results.count
        return entity
    }
    
    static func mappingImage(index: Int) -> String {
        let idPokemon = index + lastIndex + 1
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(idPokemon).png"
    }
    
    static func mappingPokemonHome(pokemon: HomeModel.PokemonHome, index: Int) -> PokemonHomeEntity {
        let entity = PokemonHomeEntity()
        entity.name = pokemon.name
        entity.url = pokemon.url
        entity.image = mappingImage(index: index)
        return entity
    }
}
