//
//  SectionsSlider.swift
//  Pokedex
//
//  Created by Thiago Vaz on 03/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class SectionsSlider: Sections {
    
    let sprites: [String]
    let color: UIColor
    
    
    init(items: [Any], id: String, sprites: [String], color: UIColor){
        self.sprites = sprites
        self.color = color
        super.init(items: items, id: id)
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return SliderCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cellSlider = cell as? SliderCell {
            cellSlider.populate(sprites: self.sprites, color: color)
        }
    }
    
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
}
