//
//  HomeWireframe.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit


class HomeWireframe {

    var viewcontroller: UIViewController?
    
    func makeHome() -> HomeListView {
        let interactor = HomeInteractor(manager: PokedexManager())
        let presenter = HomePresenter(interactor: interactor, wireframe: self)
        interactor.output = presenter
        let homeView = HomeListView(collectionViewLayout: UICollectionViewFlowLayout())
        homeView.presenter = presenter
        presenter.output = homeView
        viewcontroller = homeView
        return homeView
    }
    
    func showPokemon(namePokemon: String) {
        let detailView = DetailPokemonWireframe().makeScreen(name: namePokemon)
        viewcontroller?.navigationController?.pushViewController(detailView, animated: true)
    }
}
