//
//  HomeProtocol.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol HomePresenterInput {
    func updateView()
    func paginate()
}

protocol HomePresenterOuput: class {
    func loading()
    func stopLoading()
    func fetched(items: [HomePokemonItem])
    func navigationTitle(with name: String)
}
protocol HomeInteractorInput {
   func fetch()

}

protocol HomeInteractorOutput: class {
    func fetched(results: [PokemonHomeEntity])
    func fetchError(width error: Error)
}
