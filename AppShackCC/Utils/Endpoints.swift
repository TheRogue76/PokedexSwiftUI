//
//  Endpoints.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import Foundation

enum Endpoints {
    case getAllPokemon
    case getPokemonById(Int)
    
    var path: String {
        switch self {
        case .getAllPokemon:
            return "/pokemon"
        case .getPokemonById(let id):
            return "/pokemon/\(id)"
        }
    }
    
}
