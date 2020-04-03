//
//  genericInteractor.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol GenericInteractorInput {
    func fetch()
}

class GenericInteractor: GenericInteractorInput {
    let id:String
    let manager: PokedexManager
    let interactor: TypePokemonInteractorInput
    
    init(id:String, manager: PokedexManager, interactor: TypePokemonInteractorInput) {
        self.id = id
        self.manager = manager
        self.interactor = interactor
    }
    
    func fetch() {
       
    }
}
