//
//  ProfileScreen+ViewModel.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-21.
//

import Foundation

extension ProfileScreen {
    @MainActor
    class ViewModel: ObservableObject {
        @Published private(set) var listOfAllPokemon: [BaseNameURL]? = nil
        
        @Published var selectedPokemon: Pokemon?
        
        @Published var isShowingDetail: Bool = false {
            didSet {
                if isShowingDetail == false {
                    selectedPokemon = nil
                }
            }
        }
        
        func fetchAllPokemon() -> Void {
            Task {
                do {
                    listOfAllPokemon = try await Network.shared.getAllPokemon().results
                } catch {
                    logError(error)
                }
            }
        }
        
        func fetchPokemonByUrlAndSetSelected(url: String) -> Void {
            isShowingDetail = true
            Task {
                do {
                    selectedPokemon = try await Network.shared.getPokemonByUrl(url: url)
                } catch {
                    logError(error)
                }
            }
        }
        
        init() {
            fetchAllPokemon()
        }
    }
}
