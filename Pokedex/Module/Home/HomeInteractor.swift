//
//  HomeInteractor.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation


class HomeInteractor: HomeInteractorInput {
    
    weak var output: HomeInteractorOutput?
    
    let manager: PokedexManager
    
    var home: HomeEntity?
    
    init(manager: PokedexManager) {
        self.manager = manager
    }
    
    func fetch() {
        manager.fetchHome { (result) in
            switch result {
            case .success(let homeModel):
                self.home = HomeEntityMapper.mappingHome(model: homeModel)
                guard let results = self.home?.results else {
                    return
                }
                self.output?.fetched(results: results)
            case .failure(let error):
                self.output?.fetchError(width: error)
            }
        }
    }
    
    func paginate() {
        guard let nextPage = home?.next, nextPage.isEmpty else {
            output?.finish()
            return
        }
        
    }
    
    
}
