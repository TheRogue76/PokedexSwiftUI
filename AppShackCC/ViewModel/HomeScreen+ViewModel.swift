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
        @Published private(set) var randomPokemon: Pokemon?
        
        @Published var isShowingDetail = false
        
        var isLoading: Bool {
            randomPokemon == nil
        }
        
        var title: String {
            isLoading ? "A new Pokemon is about to appear!" : "A new Pokemon has appeared!"
        }
        
        func fetchRandomPokemon() -> Void {
            Task {
                do {
                    let res = try await Network.shared.getAllPokemon()
                    guard let url = res.results.randomElement()?.url else {
                        return
                    }
                    randomPokemon = try await Network.shared.getPokemonByUrl(url: url)
                } catch {
                    logError(error)
                }
            }
        }
        
        func resetPokemon() -> Void {
            randomPokemon = nil
        }
        
        init() {
            fetchRandomPokemon()
        }
    }
}
