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
        
        @Published var bookmarkedPokemon: [String] = []
        
        var isBookmarked: Bool {
            guard let pokemon else {
                return false
            }
            return bookmarkedPokemon.contains(pokemon.name)
        }
        
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
        
        func bookmarkToggle() -> Void {
            guard let pokemon else { return }
            if isBookmarked {
                guard let index = bookmarkedPokemon.firstIndex(of: pokemon.name) else { return }
                bookmarkedPokemon.remove(at: index)
            } else {
                bookmarkedPokemon.append(pokemon.name)
            }
            UserDefaults.standard.set(bookmarkedPokemon, forKey: bookmarksStorageKey)
        }
        
        init(pokemon: Pokemon?) {
            self.pokemon = pokemon
            if let bookmarks = UserDefaults.standard.array(forKey: bookmarksStorageKey) as? [String] {
                bookmarkedPokemon = bookmarks
            }
        }
        
    }
}
