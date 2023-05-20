//
//  HomeScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI
import SkeletonUI

struct HomeScreen: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title2)
            if !viewModel.isLoading {
                Text("Click on it to learn more!")
                    .font(.title3)
            }
            ImageView(pokeUrlString: viewModel.randomPokemon?.sprites.frontDefault)
                .skeleton(with: viewModel.randomPokemon?.sprites.frontDefault == nil)
                .shape(type: .rectangle)
                .frame(width: 200, height: 200)
                .cornerRadius(8)
                .shadow(radius: 8)
                .onTapGesture {
                    viewModel.isShowingDetail = true
                }
            Text(viewModel.randomPokemon?.name.capitalized ?? "Loading")
                .font(.title)
                
        }
        .toolbar(content: {
            Button {
                viewModel.resetPokemon()
                viewModel.fetchRandomPokemon()
            } label: {
                Image(systemName: "arrow.clockwise")
            }
        })
        .navigationDestination(isPresented: $viewModel.isShowingDetail) {
            if let pokemon = viewModel.randomPokemon {
                PokemonDetailScreen(pokemon: pokemon)
            }
        }
        .navigationTitle("Home Screen")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeScreen()
        }
    }
}
