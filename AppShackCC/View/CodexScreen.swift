//
//  CodexScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI

struct CodexScreen: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                VStack {
                    Text("Loading Data")
                    ProgressView()
                }
            } else {
                Form {
                    List {
                        ForEach(viewModel.filteredListOfPokemon, id: \.name) { pokemon in
                            Button {
                                viewModel.fetchPokemonByUrlAndSetSelected(url: pokemon.url)
                            } label: {
                                HStack {
                                    Text(pokemon.name)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .searchable(text: $viewModel.searchableText)
                .autocorrectionDisabled(false)
            }
        }
        .navigationTitle("The Codex")
        .navigationDestination(isPresented: $viewModel.isShowingDetail) {
            PokemonDetailScreen(pokemon: viewModel.selectedPokemon)
        }
    }
}

struct CodexScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CodexScreen()
        }
    }
}
