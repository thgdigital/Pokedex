//
//  HomePokemonItemMapper.swift
//  Pokedex
//
//  Created by Thiago Vaz on 31/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class HomePokemonItemMapper {
    
    static func mapping(entity: PokemonHomeEntity) -> HomePokemonItem {
        let item = HomePokemonItem()
        item.image = URL(string: entity.image)
        item.name = entity.name.capitalized
        item.url = URL(string: entity.url)
        item.types = entity.type
        if let type = entity.type.first, let background = UIColor.ColorString(rawValue: type) {
            item.background = UIColor(background)
        }
        return item
    }
    
    static func appendLoading(with number: Int) -> [HomePokemonItemLoading] {
        var placeholders = [HomePokemonItemLoading]()
        for _ in 1...number {
            placeholders.append(HomePokemonItemLoading())
        }
        
        return placeholders
    }
}
