//
//  CodexScreen+ViewModel.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-21.
//

import Foundation

extension CodexScreen {
    @MainActor
    class ViewModel: ObservableObject {
        @Published private(set) var listOfAllPokemon: [BaseNameURL]? = nil {
            didSet {
                setFilteredList()
            }
        }
        
        @Published private(set) var filteredListOfPokemon: [BaseNameURL] = []
        
        @Published var searchableText: String = "" {
            didSet {
                setFilteredList()
            }
        }
        
        @Published var selectedPokemon: Pokemon?
        
        @Published var isShowingDetail: Bool = false {
            didSet {
                if isShowingDetail == false {
                    selectedPokemon = nil
                }
            }
        }
        
        var isLoading: Bool {
            listOfAllPokemon == nil
        }
        
        func setFilteredList() -> Void {
            guard let listOfAllPokemon else {
                filteredListOfPokemon = []
                return
            }
            if searchableText.isEmpty {
                filteredListOfPokemon = listOfAllPokemon
            } else {
                filteredListOfPokemon = listOfAllPokemon.filter{ $0.name.lowercased().contains(searchableText.lowercased()) }
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
