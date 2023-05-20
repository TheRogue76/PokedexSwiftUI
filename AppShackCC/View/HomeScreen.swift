//
//  HomeScreen.swift
//  AppShackCC
//
//  Created by Parsa on 2023-05-19.
//

import SwiftUI
import SkeletonUI

struct ImageView: View {
    var pokeUrlString: String?
    
    var placeholder: some View {
        Rectangle()
    }
    
    var body: some View {
        if let pokeUrlString, let imageUrl = URL(string: pokeUrlString) {
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                case .failure(_):
                    Rectangle()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                @unknown default:
                    Rectangle()
                }
            }
        } else {
            Rectangle()
        }
    }
}

struct HomeScreen: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Home Screen")
            ImageView(pokeUrlString: viewModel.randomPokemon?.sprites.frontDefault)
                .skeleton(with: viewModel.randomPokemon?.sprites.frontDefault == nil)
                .frame(width: 100, height: 100)
            Text(String(viewModel.isLoading))
            Text(viewModel.randomPokemon?.name ?? "None loaded")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
