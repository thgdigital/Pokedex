//
//  DetailPokemonProtocol.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol DetailPokemonPresenterInput {
    func viewDidLoad()
}

protocol DetailPokemonPresenterOutput:  class {
    func changeTitle(with name: String)
    func reloadSections(sections: [Sections])
}

protocol DetailPokemonInteractorInput {
    func fetch(pokemon: String)
}

protocol DetailPokemonInteractorOutput: class {
    func resultResquest(entity: PokemonEntity)
}
