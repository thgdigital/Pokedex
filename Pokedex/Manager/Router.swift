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
    case paginate(parameters: [String: String])
    
    static let baseURLString = "https://pokeapi.co/api/v2/"

    var method: HTTPMethod {
        switch self {
        case .getPokemos, .readPokemon, .paginate:
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
        }
    }

    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case  let .paginate(parameters):
              urlRequest = try URLEncodedFormParameterEncoder().encode(parameters, into: urlRequest)
        default:
            break
        }
        return urlRequest
    }
}
