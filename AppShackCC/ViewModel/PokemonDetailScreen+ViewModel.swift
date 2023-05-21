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
        @Published var pokemon: Pokemon? {
            didSet {
                if pokemon != nil {
                    fetchEvolution()
                }
            }
        }
        
        @Published var evolution: Evolution?
        
        func fetchEvolution() -> Void {
            guard let pokemon else {
                return
            }
            Task {
                do {
                    let species = try await Network.shared.getPokemonSpeciesByUrl(url: pokemon.species.url)
                    evolution = try await Network.shared.getEvolutionByUrl(url: species.EvolutionChain.url)
                } catch {
                    logError(error)
                }
            }
        }
        
        init(pokemon: Pokemon?) {
            self.pokemon = pokemon
        }
        
    }
}
