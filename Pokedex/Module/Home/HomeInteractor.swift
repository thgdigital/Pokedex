//
//  HomeInteractor.swift
//  Pokedex
//
//  Created by Thiago Vaz on 24/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation


class HomeInteractor: HomeInteractorInput {
    
    weak var output: HomeInteractorOutput?
    
    var shoudPagination: Bool = true

    let manager: PokedexManager
    
    var home: HomeEntity?
    
    init(manager: PokedexManager) {
        self.manager = manager
    }
    
    func fetch() {
        manager.fetchHome { (result) in
            switch result {
            case .success(let homeModel):
                self.home = HomeEntityMapper.mappingHome(model: homeModel)
                guard let results = self.home?.results else {
                    return
                }
                self.output?.fetched(results: results)
            case .failure(let error):
                self.output?.fetchError(width: error)
            }
        }
    }
    
    func paginate() {
        guard let nextPage = home?.next, !nextPage.isEmpty else {
            output?.finish()
            return
        }
        
        guard let urlString  = URL(string: nextPage) else {
            return
        }
        
        if let components = URLComponents(url: urlString, resolvingAgainstBaseURL: false) , shoudPagination {
            if let queryItems = components.queryItems {
                let offset = getParamanter(queryItems:queryItems, name: "offset")
                let limit = getParamanter(queryItems:queryItems, name: "limit")
                shoudPagination = false
                manager.paginate(offset: offset, limit: limit) { (result) in
                    self.shoudPagination = true
                    switch result{
                    case .success(let homeModel):
                        print(homeModel)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    
    func getParamanter(queryItems: [URLQueryItem], name: String) -> String {
        guard let queryItem = queryItems.filter({ $0.name.lowercased() == name }).first?.value else {
            return ""
        }
        return queryItem
    }
}
