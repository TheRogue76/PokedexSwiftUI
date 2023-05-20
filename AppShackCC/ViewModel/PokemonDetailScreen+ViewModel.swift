//
//  PokemonDetailScreen+ViewModel.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import Foundation

extension PokemonDetailScreen {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var pokemon: Pokemon
        
        @Published var evolution: Evolution?
        
        init(pokemon: Pokemon) {
            self.pokemon = pokemon
            fetchEvolution()
        }
        
        func fetchEvolution() -> Void {
            Task {
                do {
                    let species = try await Network.shared.getPokemonSpeciesByUrl(url: pokemon.species.url)
                    evolution = try await Network.shared.getEvolutionByUrl(url: species.EvolutionChain.url)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
