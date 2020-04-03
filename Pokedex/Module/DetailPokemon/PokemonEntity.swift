//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by Thiago Vaz on 03/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class PokemonEntity: NSObject  {
    var id: String = ""
    var sprites: [String] = []
    var background: UIColor = .white
}

class PokemonEntityMapper {
    static func mapping(model: PokemonModel) -> PokemonEntity {
        var sprites: [String] = []
        let entity = PokemonEntity()
        entity.id = "\(model.id)"
        sprites.append(model.sprites.frontDefault)
        sprites.append(model.sprites.backDefault)
        sprites.append(model.sprites.frontShiny)
        sprites.append(model.sprites.backShiny)
        sprites.append(model.sprites.frontFemale ?? "")
        sprites.append(model.sprites.backFemale ?? "")
        sprites.append(model.sprites.frontShinyFemale ?? "")
        sprites.append(model.sprites.backShinyFemale ?? "")
        if let type = model.types.first(where: { ($0.slot == 1) })?.type.name, let background = UIColor.ColorString(rawValue: type) {
            entity.background = UIColor(background)
        }
        entity.sprites = sprites.filter({ !($0.isEmpty)})
        return entity
    }
}
