//
//  PokedexManager.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Alamofire

class PokedexManager: NSObject {
    
    @discardableResult
    private func performRequest(route: Router, completion: @escaping (AFDataResponse<Any>) -> Void) -> DataRequest {
        return AF.request(route).validate().responseJSON {response in
            completion(response)
        }
    }
    
    func fetchHome(completionHandler: @escaping  (Result<HomeModel, AFError>)-> Void) {
        performRequest(route: .getPokemos) { response in
            switch response.result {
                
            case .success:
                
                guard let data = response.data, let homeModel: HomeModel = self.decodeParse(jsonData: data) else {
                    return
                }
                completionHandler(.success(homeModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
    func paginate(offset: String, limit: String, completionHandler: @escaping  (Result<HomeModel, AFError>)-> Void) {
        performRequest(route: .paginate(parameters: ["offset": offset, "limit": limit]) ) { response in
            switch response.result {
                
            case .success:
                
                guard let data = response.data, let homeModel: HomeModel = self.decodeParse(jsonData: data) else {
                    return
                }
                completionHandler(.success(homeModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func detail(name: String, completionHandler: @escaping  (Result<PokemonModel, AFError>)-> Void) {
        performRequest(route: .readPokemon(idPokemon: name)) { response in
            switch response.result {
            case .success:
                guard let data = response.data, let pokemonModel: PokemonModel = self.decodeParse(jsonData: data) else {
                    return
                }
                completionHandler(.success(pokemonModel))
            case .failure(let error):
                debugPrint(error)
            }
        }
        
    }
    
    func evolution(idPokemon: String){
        performRequest(route: .evolution(idPokemon: idPokemon)) { response in
            switch response.result {
            case .success:
                guard let data = response.data, let pokemonModel: PokemonModel = self.decodeParse(jsonData: data) else {
                    return
                }
            //                completionHandler(.success(pokemonModel))
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func typePokemon(idPokemon: String){
        performRequest(route: .typePokemon(id: idPokemon)) { response in
            switch response.result {
            case .success:
                guard let data = response.data, let pokemonModel: PokemonModel = self.decodeParse(jsonData: data) else {
                    return
                }
            //                completionHandler(.success(pokemonModel))
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func kalosPokemon(completionHandler: @escaping  (Result<Kalos, AFError>)-> Void){
        performRequest(route: .kalos) { response in
            switch response.result {
            case .success:
              guard let data = response.data, let kalosModel: Kalos = self.decodeParse(jsonData: data) else {
                    return
                }
                
              completionHandler(.success(kalosModel))
            case .failure(let error):
                debugPrint(error)
                completionHandler(.failure(error))
            }
        }
    }
    
    fileprivate func decodeParse<T: Codable>(jsonData: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode(T.self, from: jsonData)
            return items
        } catch {
            return nil
        }
    }
}

