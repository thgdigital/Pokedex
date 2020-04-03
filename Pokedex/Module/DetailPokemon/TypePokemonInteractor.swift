//
//  TypePokemonInteractor.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol TypePokemonInteractorInput: GenericInteractorInput {

}

class TypePokemonInteractor: GenericInteractor {
    
    override func fetch() {
        manager.typePokemon(idPokemon: id)
    }
}
