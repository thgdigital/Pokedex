//
//  PaginateRequest.swift
//  Pokedex
//
//  Created by Thiago Vaz on 31/03/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation
import Alamofire

struct PaginateRequest {
    let offset: String
    let limit: String
}

extension PaginateRequest: Router {
    var parameters: Parameters? {
        return ["offset": offset,
                "limit": limit]
    }

   var route: Router {
        return .paginate
    }
}
