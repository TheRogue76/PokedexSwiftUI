//
//  ProfileScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 200, height: 200)
            Text("Username")
                .font(.title)
            Form {
                Section {
                    if viewModel.bookmarkedPokemon.isEmpty {
                        Text("There are no bookmarked pokemon")
                    } else {
                        ForEach(viewModel.bookmarkedPokemon, id: \.name) { pokemon in
                            Button {
                                viewModel.fetchPokemonByUrlAndSetSelected(url: pokemon.url)
                            } label: {
                                HStack {
                                    Text(pokemon.name.capitalized)
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                }
                                .foregroundColor(.primary)
                            }
                        }
                    }
                } header: {
                    Text("Bookmarked Items")
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.isShowingDetail) {
            PokemonDetailScreen(pokemon: viewModel.selectedPokemon)
        }
        .onAppear {
            viewModel.refetchBookmarks()
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavigationStack()
    }
}
