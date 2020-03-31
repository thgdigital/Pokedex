//
//  ReusableIdentifier.swift
//  Pokedex
//
//  Created by Thiago Vaz on 31/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol Identifier{}

extension Identifier where Self: NSObject{
    
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifier {}
