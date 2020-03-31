//
//  Router.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    case getPokemos
    case readPokemon(idPokemon: Int)
    
    static let baseURLString = "https://pokeapi.co/api/v2/"

    var method: HTTPMethod {
        switch self {
        case .getPokemos, .readPokemon:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getPokemos:
            return "/pokemon"
        case .readPokemon(let idPokemon):
            return "/pokemon/\(idPokemon)"
        }
    }

    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}