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
    @IBOutlet weak var firsttitleLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var firstTypeView: UIView!
    @IBOutlet weak var secondTypeView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstTypeView.layer.cornerRadius = 5
        firstTypeView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        secondTypeView.layer.cornerRadius = 5
        secondTypeView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
    }
    
    func populate(item: HomePokemonItem) {
        self.titleLbl.text = item.name
        self.pokemonIV.sd_setImage(with: item.image, completed: nil)
        backgroundColor = item.background
        
        if item.types.count == 2 {
            firstTypeView.isHidden = false
            firsttitleLbl.text = item.types.first?.capitalized
            secondTypeView.isHidden = false
            secondLbl.text = item.types.last?.capitalized
        } else {
            firstTypeView.isHidden = false
            firsttitleLbl.text = item.types.first?.capitalized
            secondTypeView.isHidden = true
        }
    
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        firsttitleLbl.text = ""
         firsttitleLbl.text = ""
        firstTypeView.isHidden = true
        secondTypeView.isHidden = true
    }
}
