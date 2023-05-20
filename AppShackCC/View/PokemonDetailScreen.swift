//
//  PokemonDetailScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import SwiftUI

struct PokemonDetailScreen: View {
    @ObservedObject var viewModel: ViewModel
    init(pokemon: Pokemon) {
        self.viewModel = ViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        VStack {
            ImageView(pokeUrlString: viewModel.pokemon.sprites.frontDefault)
                .frame(height: 200)
            Form {
                Section {
                    Text("Name: \(viewModel.pokemon.name)")
                    Text("Height: \(viewModel.pokemon.height)")
                    Text("Weight: \(viewModel.pokemon.weight)")
                } header: {
                    Text("Core properties")
                }
                Section {
                    ForEach(viewModel.pokemon.abilities, id: \.ability?.name) { ability in
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
        .navigationTitle(viewModel.pokemon.name.capitalized)
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
