//
//  SectionsMapper.swift
//  Pokedex
//
//  Created by Thiago Vaz on 03/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class SectionsMapper {
    
    static func make(entity: PokemonEntity) -> [Sections] {
        var sections: [Sections] = []
        sections.append(SectionsSlider(items: [""], id: entity.id, sprites: entity.sprites, color: entity.background))
        return sections
    }
}
