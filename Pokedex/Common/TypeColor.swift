//
//  TypeColor.swift
//  Pokedex
//
//  Created by Thiago Vaz on 02/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(_ colorString: ColorString) {
        switch colorString {
        case .bug:
            self.init(red:198/255, green: 209/255, blue: 209/255, alpha:1.0)
        case .dark:
            self.init(red: 162/255, green:146/255, blue: 136/255, alpha:1.0)
        case .dragon:
             self.init(red: 162/255, green:125/255, blue: 250/255, alpha:1.0)
        case .electric:
            self.init(red: 250/255, green:224/255, blue: 120/255, alpha:1.0)
        case .fairy:
            self.init(red: 244/255, green:189/255, blue: 201/255, alpha:1.0)
        case .fighting:
            self.init(red: 214/255, green:120/255, blue: 115/255, alpha:1.0)
        case .fire:
            self.init(red: 245/255, green:172/255, blue: 120/255, alpha:1.0)
        case .flying:
            self.init(red: 198/255, green:183/255, blue: 245/255, alpha:1.0)
        case .ghost:
            self.init(red: 162/255, green:146/255, blue: 188/255, alpha:1.0)
        case .grass:
            self.init(red: 167/255, green:219/255, blue: 141/255, alpha:1.0)
        case .ground:
            self.init(red: 235/255, green:214/255, blue: 157/255, alpha:1.0)
        case .ice:
            self.init(red: 188/255, green:230/255, blue: 230/255, alpha:1.0)
        case .normal:
            self.init(red: 198/255, green:198/255, blue: 167/255, alpha:1.0)
        case .poison:
            self.init(red: 193/255, green:131/255, blue: 193/255, alpha:1.0)
        case .psychic:
            self.init(red: 250/255, green:146/255, blue: 178/255, alpha:1.0)
        case .rock:
            self.init(red: 209/255, green:193/255, blue: 125/255, alpha:1.0)
        case .steel:
            self.init(red: 209/255, green:209/255, blue: 224/255, alpha:1.0)
        case .metal:
            self.init(red: 179/255, green:166/255, blue: 161/255, alpha:1.0)
        case .water:
            self.init(red: 157/255, green:183/255, blue: 245/255, alpha:1.0)
        }
    }
    enum ColorString: String  {
        case bug
        case dark
        case dragon
        case electric
        case fairy
        case fighting
        case fire
        case flying
        case ghost
        case grass
        case ground
        case ice
        case normal
        case poison
        case psychic
        case rock
        case steel
        case metal
        case water
    }
}
