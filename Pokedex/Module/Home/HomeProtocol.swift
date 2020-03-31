//
//  HomeProtocol.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol HomePresenterInput {
    var finishPagination: Bool { get set }
    func updateView()
    func paginate()
    func didSelected(with index: Int)
}

protocol HomePresenterOuput: class {
    func loading()
    func stopLoading()
    func fetched(items: [HomePokemonItem])
    func fetched(paginate: [HomePokemonItem])
    func navigationTitle(with name: String)
}

protocol HomeInteractorInput {
    var home: HomeEntity? { get set }
    func fetch()
    func paginate()
}

protocol HomeInteractorOutput: class {
    func fetched(results: [PokemonHomeEntity])
    func fetched(paginate: [PokemonHomeEntity])
    func fetchError(width error: Error)
    func finish()
}
