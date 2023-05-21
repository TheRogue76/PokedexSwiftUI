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
        
        @Published var bookmarkedPokemonNames: [String]
        
        var isBookmarked: Bool {
            guard let pokemon else {
                return false
            }
            return bookmarkedPokemonNames.contains(pokemon.name)
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
                guard let index = bookmarkedPokemonNames.firstIndex(of: pokemon.name) else { return }
                bookmarkedPokemonNames.remove(at: index)
            } else {
                bookmarkedPokemonNames.append(pokemon.name)
            }
            UserDefaults.standard.set(bookmarkedPokemonNames, forKey: bookmarksStorageKey)
        }
        
        init(pokemon: Pokemon?) {
            self.pokemon = pokemon
            if let bookmarks = UserDefaults.standard.array(forKey: bookmarksStorageKey) as? [String] {
                bookmarkedPokemonNames = bookmarks
            } else {
                bookmarkedPokemonNames = []
            }
        }
        
    }
}
