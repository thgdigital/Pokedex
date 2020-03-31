//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation


class HomePresenter: HomePresenterInput {
    
    var finishPagination: Bool = false
    
    var items: [HomePokemonItem] = [HomePokemonItem]()
    
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
        interactor.paginate()
    }
    
    func didSelected(with index: Int) {
        
    }
    
    func finish() {
        items = filterLoading()
        finishPagination = true
        output?.fetched(paginate: items)
    }
    
    func filterLoading() -> [HomePokemonItem] {
        items = items.filter({ !($0 is HomePokemonItemLoading) })
        return items
    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func fetchError(width error: Error) {
        
    }
    
    func fetched(results: [PokemonHomeEntity]) {
        items = results.map({ HomePokemonItemMapper.mapping(entity: $0) })
        items.append(contentsOf: HomePokemonItemMapper.appendLoading(with: 3))
        output?.fetched(items: items)
    }
    
    func fetched(paginate: [PokemonHomeEntity]) {
        items = filterLoading()
        items.append(contentsOf: paginate.map({ HomePokemonItemMapper.mapping(entity: $0) }))
        
        
         if let homeCount = self.interactor.home?.count, (homeCount % items.count) != 0 {
            let appendLoading = HomePokemonItemMapper.appendLoading(with: 3)
           items.append(contentsOf:appendLoading)
        }
        output?.fetched(paginate: items)
    }
}
