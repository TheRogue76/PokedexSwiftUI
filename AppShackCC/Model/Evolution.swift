//
//  Evolution.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import Foundation

// MARK: - Evolution
struct Evolution: Codable {
    let id: Int
    let chain: Chain
    
    // MARK: - Chain
    struct Chain: Codable {
        let isBaby: Bool
        let species: Species
        let evolvesTo: [EvolvesTo]

        enum CodingKeys: String, CodingKey {
            case isBaby = "is_baby"
            case species
            case evolvesTo = "evolves_to"
        }
    }
    
    // MARK: - EvolvesTo
    struct EvolvesTo: Codable {
        let isBaby: Bool
        let species: Species

        enum CodingKeys: String, CodingKey {
            case isBaby = "is_baby"
            case species
        }
    }
    
    // MARK: - Species
    struct Species: Codable {
        let name: String
        let url: String
    }
}
