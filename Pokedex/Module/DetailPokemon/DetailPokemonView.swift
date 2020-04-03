//
//  DetailPokemonView.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class DetailPokemonView: CollectionViewController {
    
    var presenter: DetailPokemonPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.viewDidLoad()
    }
}

extension DetailPokemonView: DetailPokemonPresenterOutput {
    func reloadSections(sections: [Sections]) {
        self.sections = sections
        collectionView.reloadData()
    }
    
    func changeTitle(with name: String) {
        title = name
    }
}
