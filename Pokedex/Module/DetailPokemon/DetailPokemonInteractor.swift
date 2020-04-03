//
//  DetailPokemonInteractor.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class DetailPokemonInteractor: DetailPokemonInteractorInput {
    weak var output: DetailPokemonInteractorOutput?
    let manager: PokedexManager
    
    init(manager: PokedexManager) {
        self.manager = manager
    }
    
    func fetch(pokemon: String) {
        manager.detail(name: pokemon) { response in
            switch response {
                
            case .success(let value):
                let entity = PokemonEntityMapper.mapping(model: value)
                self.output?.resultResquest(entity: entity)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
