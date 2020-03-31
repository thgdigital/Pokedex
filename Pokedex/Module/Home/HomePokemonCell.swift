//
//  HomePokemonCell.swift
//  Pokedex
//
//  Created by Thiago Vaz on 31/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit
import SDWebImage

class HomePokemonCell: UICollectionViewCell {
    @IBOutlet weak var pokemonIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        layer.borderColor = UIColor.gray.cgColor
//        layer.borderWidth = 1.0
//        backgroundColor = .clear
    }
    
    func populate(item: HomePokemonItem) {
        self.titleLbl.text = item.name
        self.pokemonIV.sd_setImage(with: item.image, completed: nil)
    }

}
