//
//  Network.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case encodingError
}

class Network {
    static let shared = Network()
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2")!
}

extension Network {
    func fetchAllPokemon() async throws {
        let path = Endpoints.fetchAllPokemon.path
    }
}
