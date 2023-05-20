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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailScreen(pokemon: Pokemon.dummy)
    }
}
