//
//  Kalo.swift
//  Pokedex
//
//  Created by Thiago Vaz on 03/04/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

// MARK: - Kalo
struct Kalo: Codable {
    let abilities: [String]
    let detailPageURL: String
    let weight: Double
    let weakness: [Weakness]
    let number: String
    let height: Int
    let collectiblesSlug, featured, slug, name: String
    let thumbnailAltText: String
    let thumbnailImage: String
    let id: Int
    let type: [TypePokemon]

    enum CodingKeys: String, CodingKey {
        case abilities, detailPageURL, weight, weakness, number, height
        case collectiblesSlug = "collectibles_slug"
        case featured, slug, name
        case thumbnailAltText = "ThumbnailAltText"
        case thumbnailImage = "ThumbnailImage"
        case id, type
    }
}

enum TypePokemon: String, Codable {
    case bug = "bug"
    case dark = "dark"
    case dragon = "dragon"
    case electric = "electric"
    case fairy = "fairy"
    case fighting = "fighting"
    case fire = "fire"
    case flying = "flying"
    case ghost = "ghost"
    case grass = "grass"
    case ground = "ground"
    case ice = "ice"
    case normal = "normal"
    case poison = "poison"
    case psychic = "psychic"
    case rock = "rock"
    case steel = "steel"
    case water = "water"
}

enum Weakness: String, Codable {
    case bug = "Bug"
    case dark = "Dark"
    case dragon = "Dragon"
    case electric = "Electric"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case flying = "Flying"
    case ghost = "Ghost"
    case grass = "Grass"
    case ground = "Ground"
    case ice = "Ice"
    case poison = "Poison"
    case psychic = "Psychic"
    case rock = "Rock"
    case steel = "Steel"
    case water = "Water"
}

typealias Kalos = [Kalo]
