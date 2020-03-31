//
//  LoadingCell.swift
//  Pokedex
//
//  Created by Thiago Vaz on 31/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class LoadingCell: UICollectionViewCell {

    @IBOutlet weak var pokemonView: UIView!
    
    @IBOutlet weak var nameView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pokemonView.layer.cornerRadius = 5
        nameView.layer.cornerRadius = 5
    }

}
