//
//  PokemonSpecies.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import Foundation

//MARK: PokemonSpecies
struct PokemonSpecies: Codable {
    let id: Int
    let EvolutionChain: EvolutionChainURL
    
    enum CodingKeys: String, CodingKey {
        case id
        case EvolutionChain = "evolution_chain"
    }
    
    //MARK: EvolutionChainURL
    struct EvolutionChainURL: Codable {
        let url: String
    }
}
