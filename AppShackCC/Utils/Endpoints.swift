//
//  Endpoints.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import Foundation

enum Endpoints {
    case getCountOfPokemon
    case getAllPokemon
    case getPokemonById(Int)
    
    var path: String {
        switch self {
        case .getCountOfPokemon:
            return "/pokemon"
        case .getAllPokemon:
            return "/pokemon"
        case .getPokemonById(let id):
            return "/pokemon/\(id)"
        }
    }
    
}
