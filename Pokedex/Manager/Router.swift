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
    case readPokemon(idPokemon: String)
    case paginate(parameters: [String: String])
    case evolution(idPokemon: String)
    case typePokemon(id: String)
    case kalos
    
    static let baseURLString = "https://pokeapi.co/api/v2"
    static let baseUrlExternal = "https://www.pokemon.com/us/api/pokedex"
    
    var method: HTTPMethod {
        switch self {
        case .getPokemos, .readPokemon, .paginate, .evolution, .typePokemon, .kalos:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getPokemos:
            return "/pokemon"
        case .readPokemon(let idPokemon):
            return "/pokemon/\(idPokemon)"
        case .paginate:
            return "/pokemon"
        case .evolution(let idPokemon):
            return "/evolution-chain/\(idPokemon)"
        case .typePokemon(let idPokemon):
            return "/type/\(idPokemon)"
        case .kalos:
            return "/kalos"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case let .paginate(parameters):
            urlRequest = try URLEncodedFormParameterEncoder().encode(parameters, into: urlRequest)
            
        case .kalos:
            let url = try Router.baseUrlExternal.asURL()
            urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
        default:
            break
        }
        return urlRequest
    }
}
