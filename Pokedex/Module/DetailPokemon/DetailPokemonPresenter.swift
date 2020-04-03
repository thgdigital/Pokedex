//
//  DetailPokemonPresenter.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class DetailPokemonPresenter: DetailPokemonPresenterInput {
    weak var output: DetailPokemonPresenterOutput?
    let interactor: DetailPokemonInteractorInput
    let wireframe: DetailPokemonWireframe
    let namePokemon: String
    
    var sections: [Sections] = []
    
    init(interactor: DetailPokemonInteractorInput, namePokemon: String, wireframe: DetailPokemonWireframe) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.namePokemon = namePokemon
    }
    
    func viewDidLoad() {
        output?.changeTitle(with: namePokemon.uppercased())
        interactor.fetch(pokemon: namePokemon)
    }
}

extension DetailPokemonPresenter: DetailPokemonInteractorOutput {
    
    func resultResquest(entity: PokemonEntity) {
        sections = SectionsMapper.make(entity: entity)
        output?.reloadSections(sections: sections)
    }
    
    
}
