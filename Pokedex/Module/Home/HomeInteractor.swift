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
    
    var kalos: Kalos?
    
    
    
    init(manager: PokedexManager) {
        self.manager = manager
    }
    
    fileprivate func dataPokemon(model: HomeModel) {
        
        manager.kalosPokemon{ (result) in
            switch result {
            case .success(let kalos):
                self.kalos = kalos
                self.home = HomeEntityMapper.mappingHome(model: model, kalos: kalos)
                guard let result = self.home?.results else {
                    return
                }
                self.output?.fetched(results: result)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    
    
    func fetch() {
        
        
        
        manager.fetchHome { (result) in
            switch result {
            case .success(let homeModel):
                self.dataPokemon(model: homeModel)
                
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
                        self.home = HomeEntityMapper.mappingHome(model: homeModel, kalos: self.kalos ?? [])
                        guard let results = self.home?.results else {
                            return
                        }
                        self.output?.fetched(paginate: results)
                    case .failure(let error):
                        self.output?.fetchError(width: error)
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
