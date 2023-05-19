//
//  Endpoints.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import Foundation

enum Endpoints {
    case fetchAllPokemon
    
    var path: String {
        switch self {
        case .fetchAllPokemon:
            return "/pokemon"
        }
    }
    
}
