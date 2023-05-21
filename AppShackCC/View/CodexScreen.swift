//
//  CodexScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI
import SkeletonUI

struct CodexScreen: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        Form {
            List {
                if viewModel.filteredListOfPokemon.isEmpty {
                    if viewModel.isLoading {
                        ForEach(1..<20, id: \.self) { _ in
                            Text("")
                                .skeleton(with: true)
                                .shape(type: .rounded(.radius(8, style: .continuous)))
                        }
                    } else {
                        Text("No results found")
                    }
                } else {
                    ForEach(viewModel.filteredListOfPokemon, id: \.name) { pokemon in
                        Button {
                            viewModel.fetchPokemonByUrlAndSetSelected(url: pokemon.url)
                        } label: {
                            HStack {
                                Text(pokemon.name.capitalized)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.primary)
                        }
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchableText)
        .autocorrectionDisabled(false)
        .navigationTitle("The Codex")
        .navigationDestination(isPresented: $viewModel.isShowingDetail) {
            PokemonDetailScreen(pokemon: viewModel.selectedPokemon)
        }
    }
}

struct CodexScreen_Previews: PreviewProvider {
    static var previews: some View {
        CodexNavigationStack()
    }
}
