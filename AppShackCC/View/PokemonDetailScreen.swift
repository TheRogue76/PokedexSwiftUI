//
//  PokemonDetailScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-20.
//

import SwiftUI

struct PokemonDetailScreen: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            ImageView(pokeUrlString: pokemon.sprites.frontDefault)
                .frame(height: 200)
            Form {
                Section {
                    Text("Name: \(pokemon.name)")
                    Text("Height: \(pokemon.height)")
                    Text("Weight: \(pokemon.weight)")
                } header: {
                    Text("Core properties")
                }
                Section {
                    ForEach(pokemon.abilities, id: \.ability?.name) { ability in
                        Text(ability.ability?.name?.capitalized ?? "None")
                    }
                } header: {
                    Text("Abilities")
                }
            }
        }
        .navigationTitle(pokemon.name.capitalized)
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
