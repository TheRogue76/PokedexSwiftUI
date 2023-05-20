//
//  HomeScreen+ViewModel.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import Foundation

extension HomeScreen {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var isLoading: Bool = true
        
        @Published var randomPokemon: Pokemon?
        
        func fetchRandomPokemon() -> Void {
            isLoading = true
            Task {
                do {
                    let count = try await Network.shared.getPokemonCount().count
                    let randomPokemonId = Int.random(in: 1...count)
                    randomPokemon = try await Network.shared.getPokemonById(id: randomPokemonId)
                    isLoading = false
                } catch {
                    print("Error for sentry")
                }
            }
        }
    }
}
