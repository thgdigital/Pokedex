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
    private func peformRequest(route: Router, completion: @escaping (AFDataResponse<Any>) -> Void) -> DataRequest {
        return AF.request(route).responseJSON {response in
            completion(response)
        }
    }
    
    func fetchHome(completionHandler: @escaping  (Result<HomeModel, AFError>)-> Void) {
        peformRequest(route: .getPokemos) { response in
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
        peformRequest(route: .paginate(parameters: ["offset": offset, "limit": limit]) ) { response in
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
    
    func decodeParse<T: Codable>(jsonData: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode(T.self, from: jsonData)
            return items
        } catch {
            return nil
        }
    }
}

