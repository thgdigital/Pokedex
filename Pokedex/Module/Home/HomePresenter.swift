//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation


class HomePresenter: HomePresenterInput {
    
    weak var output: HomePresenterOuput?
    
    let interactor: HomeInteractorInput
    
    let wireframe: HomeWireframe
    
    init(interactor: HomeInteractorInput, wireframe: HomeWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func updateView() {
        self.interactor.fetch()
        output?.navigationTitle(with: "Pokedex")
    }
    
    func paginate() {
        
    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func fetchError(width error: Error) {
        
    }
    
    func fetched(results: [PokemonHomeEntity]) {
        output?.fetched(items: results.map({ HomePokemonItemMapper.mapping(entity: $0) }))
    }
}
