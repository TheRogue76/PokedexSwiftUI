//
//  PokemonDetailScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import SwiftUI
import SkeletonUI

struct PokemonDetailScreen: View {
    @ObservedObject var viewModel: ViewModel
    init(pokemon: Pokemon?) {
        self.viewModel = ViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        VStack {
            ImageView(pokeUrlString: viewModel.pokemon?.sprites.frontDefault)
                .skeleton(with: viewModel.pokemon == nil)
                .shape(type: .rectangle)
                .frame(width: 200, height: 200)
                .cornerRadius(8)
                .shadow(radius: 8)
            Form {
                Section {
                    if let pokemon = viewModel.pokemon {
                        Text("Name: \(pokemon.name)")
                        Text("Height: \(pokemon.height)")
                        Text("Weight: \(pokemon.weight)")
                    } else {
                        Rectangle()
                            .skeleton(with: true)
                        Rectangle()
                            .skeleton(with: true)
                        Rectangle()
                            .skeleton(with: true)
                    }
                } header: {
                    Text("Core properties")
                }
                Section {
                    ForEach(viewModel.pokemon?.abilities ?? [], id: \.ability?.name) { ability in
                        Text(ability.ability?.name.capitalized ?? "None")
                    }
                } header: {
                    Text("Abilities")
                }
                if let evolutions = viewModel.evolution?.chain.evolvesTo, !evolutions.isEmpty {
                    Section {
                        ForEach(evolutions, id: \.species.name) { evolution in
                            Text(evolution.species.name.capitalized)
                        }
                    } header: {
                        Text("Can evolve to:")
                    }
                }
            }
        }
        .toolbar(content: {
            Button {
                viewModel.bookmarkToggle()
            } label: {
                Image(systemName: viewModel.isBookmarked ? "bookmark.fill" : "bookmark")
            }

        })
        .navigationTitle(viewModel.pokemon?.name.capitalized ?? "Loading")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PokemonDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PokemonDetailScreen(pokemon: Pokemon.dummy)
        }
    }
}
