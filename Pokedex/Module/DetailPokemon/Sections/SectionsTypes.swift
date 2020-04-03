//
//  SectionsTypes.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class SectionsTypes: Sections {
    let interactor: TypePokemonInteractorInput
    
     init(interactor: TypePokemonInteractorInput, items: [Any], id: String) {
        self.interactor = interactor
        super.init(items: items, id: id)
    }
    
    override func viewDidLoad() {
        interactor.fetch()
    }
}
