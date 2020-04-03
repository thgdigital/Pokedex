//
//  DetailPokemonWireframe.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class DetailPokemonWireframe {
    
    func makeScreen(name: String) -> DetailPokemonView {
        let interactor = DetailPokemonInteractor(manager: PokedexManager())
        let presenter = DetailPokemonPresenter(interactor: interactor, namePokemon: name, wireframe: self)
        interactor.output = presenter
        let listView = DetailPokemonView(collectionViewLayout: UICollectionViewFlowLayout())
        listView.presenter = presenter
        presenter.output = listView
        return listView
    }
}
