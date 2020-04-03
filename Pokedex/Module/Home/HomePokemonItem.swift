//
//  HomePokemonItem.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class HomePokemonItem {
    var name: String = ""
    var url: URL? = URL(string: "") 
    var image: URL? = URL(string: "")
    var types: [String] = []
    var background: UIColor = .white
}


class HomePokemonItemLoading: HomePokemonItem {
    
}
